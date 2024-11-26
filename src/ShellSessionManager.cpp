/*
 * ShellSessionManager.cpp
 *
 *  Created on: 2024年11月26日
 *      Author: alji
 */

#include "ShellSessionManager.h"

namespace chip {

ShellSessionManager ShellSessionManager::sShellSessionManager;

CHIP_ERROR ShellSessionManager::Init(ShellSessionManagerInitParams &params)
{
  ChipLogProgress(NotSpecified,"ShellSessionManager::%s",__FUNCTION__);
  mInitParams = params;

  EstablishConnection(ScopedNodeId(params.nodeId,params.fabricIndex));

  return CHIP_NO_ERROR;
}

CHIP_ERROR ShellSessionManager::EstablishConnection(const ScopedNodeId & nodeId)
{
    VerifyOrReturnError(mInitParams.mCASESessionManager != nullptr, CHIP_ERROR_INCORRECT_STATE);

    mLastSessionEstablishmentError = CHIP_NO_ERROR;
    auto * connectionCallback      = Platform::New<ConnectionCallback>(*this);
    VerifyOrReturnError(connectionCallback != nullptr, CHIP_ERROR_NO_MEMORY);

    mInitParams.mCASESessionManager->FindOrEstablishSession(nodeId, connectionCallback->GetOnDeviceConnected(),
                                                            connectionCallback->GetOnDeviceConnectionFailure());

    /*
    if (mLastSessionEstablishmentError == CHIP_ERROR_NO_MEMORY)
    {
        // Release the least recently used entry
        ScopedNodeId peerToRemove;
        if (mPendingNotificationMap.FindLRUConnectPeer(peerToRemove) == CHIP_NO_ERROR)
        {
            mPendingNotificationMap.RemoveAllEntriesForNode(peerToRemove);

            // Now retry
            mLastSessionEstablishmentError = CHIP_NO_ERROR;
            // At this point connectionCallback is null since it deletes itself when the callback is called.
            connectionCallback = Platform::New<ConnectionCallback>(*this);
            mInitParams.mCASESessionManager->FindOrEstablishSession(nodeId, connectionCallback->GetOnDeviceConnected(),
                                                                    connectionCallback->GetOnDeviceConnectionFailure());
        }
    }
    */

    return mLastSessionEstablishmentError;
}


void ShellSessionManager::HandleDeviceConnected(Messaging::ExchangeManager & exchangeMgr, const SessionHandle & sessionHandle)
{
  ChipLogProgress(NotSpecified,"ShellSessionManager::%s",__FUNCTION__);
}

void ShellSessionManager::HandleDeviceConnectionFailure(const ScopedNodeId & peerId, CHIP_ERROR error)
{
  ChipLogProgress(NotSpecified,"ShellSessionManager::%s",__FUNCTION__);
}


}

