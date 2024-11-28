/*
 * ShellSessionManager.cpp
 *
 *  Created on: 2024年11月26日
 *      Author: alji
 */

#include "../matter_2.2.2/src/controller/InvokeInteraction.h"
#include "../matter_2.2.2/src/controller/ReadInteraction.h"
#include "../matter_2.2.2/src/app/CommandSender.h"
#include "../matter_2.2.2/src/app/ConcreteAttributePath.h"
#include "../matter_2.2.2/src/app/ConcreteCommandPath.h"
#include "../matter_2.2.2/src/app/MessageDef/StatusIB.h"
#include "../autogen/zap-generated/app-common/zap-generated/cluster-objects.h"
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

    ChipLogProgress(NotSpecified,"ShellSessionManager::%s, Peer Nodeid = %2x:",__FUNCTION__,sessionHandle->GetPeer().GetNodeId());

    auto onSuccess = [](const app::ConcreteCommandPath & commandPath, const app::StatusIB & status, const auto & dataResponse) {
         ChipLogProgress(NotSpecified, "OnOff command succeeds");
     };

     auto onFailure = [](CHIP_ERROR error) {
         ChipLogError(NotSpecified, "OnOff command failed: %" CHIP_ERROR_FORMAT, error.Format());
     };

  //   Clusters::OnOff::Attributes::TypeInfo::DecodableType



     using OnSuccessCallbackType =
             std::function<void(const app::ConcreteDataAttributePath & aPath, const chip::app::Clusters::OnOff::Attributes::OnOff::TypeInfo & aData)>;


     auto onReportAttribute = [](const app::ConcreteDataAttributePath & aPath, const chip::app::Clusters::OnOff::Attributes::OnOff::TypeInfo::Type & aData) {
             ChipLogProgress(NotSpecified, "%s",aData == true ? "Light ON":"Light OFF");
         };

     auto onDone = [](const SessionHandle & sessionHandle) {
                 ChipLogProgress(NotSpecified,"%s :: onDone",__func__);
     };


     Controller::SubscribeAttribute<app::Clusters::OnOff::Attributes::OnOff::TypeInfo::Type>(&exchangeMgr,sessionHandle,mInitParams.attrPath.mEndpointId,
                                                                                                                        mInitParams.attrPath.mClusterId,
                                                                                                                        mInitParams.attrPath.mAttributeId,
                                                                                                                        onReportAttribute,nullptr,0,10,nullptr,nullptr,true,onDone);
}

void ShellSessionManager::HandleDeviceConnectionFailure(const ScopedNodeId & peerId, CHIP_ERROR error)
{
  ChipLogProgress(NotSpecified,"ShellSessionManager::%s",__FUNCTION__);
}


}

