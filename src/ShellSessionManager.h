#pragma once

//#include "../matter_2.2.2/src/app/clusters/bindings/PendingNotificationMap.h"
#include "../matter_2.2.2/src/app/server/Server.h"
#include "../matter_2.2.2/src/app/CASESessionManager.h"

namespace chip {

struct ShellSessionManagerInitParams
{
      NodeId  nodeId;
      FabricIndex fabricIndex;
      FabricTable * mFabricTable               = nullptr;
      CASESessionManager * mCASESessionManager = nullptr;
//      PersistentStorageDelegate * mStorage     = nullptr;
//      bool mEstablishConnectionOnInit          = true;
};

class ShellSessionManager
{
public:
    ShellSessionManager() {}


    CHIP_ERROR Init(ShellSessionManagerInitParams &mInitParams);


    void FabricRemoved(FabricIndex fabricIndex);

    /*
     * Notify a cluster change to **all** bound devices associated with the (endpoint, cluster) tuple.
     *
     * For unicast bindings with an active session and multicast bindings, the BoundDeviceChangedHandler
     * will be called before the function returns.
     *
     * For unicast bindings without an active session, the notification will be queued and a new session will
     * be initiated. The BoundDeviceChangedHandler will be called once the session is established.
     *
     */
//  CHIP_ERROR NotifyBoundClusterChanged(EndpointId endpoint, ClusterId cluster, void * context);

    static ShellSessionManager & GetInstance() { return sShellSessionManager; }

private:
    /*
     * Used when providing OnConnection/Failure callbacks to CASESessionManager when establishing session.
     *
     * Since the BindingManager calls EstablishConnection inside of a loop, and it is possible that the
     * callback is called some time after the loop is completed, we need a separate callbacks for each
     * connection we are trying to establish. Failure to provide different instances of the callback
     * to CASESessionManager may result in the callback only be called for that last EstablishConnection
     * that was called when it establishes the connections asynchronously.
     *
     */
    class ConnectionCallback
    {
    public:
        ConnectionCallback(ShellSessionManager & shellSessionManager) :
            mShellSessionManager(shellSessionManager), mOnConnectedCallback(HandleDeviceConnected, this),
            mOnConnectionFailureCallback(HandleDeviceConnectionFailure, this)
        {}

        Callback::Callback<OnDeviceConnected> * GetOnDeviceConnected() { return &mOnConnectedCallback; }
        Callback::Callback<OnDeviceConnectionFailure> * GetOnDeviceConnectionFailure() { return &mOnConnectionFailureCallback; }

    private:
        static void HandleDeviceConnected(void * context, Messaging::ExchangeManager & exchangeMgr,
                                          const SessionHandle & sessionHandle)
        {
            ConnectionCallback * _this = static_cast<ConnectionCallback *>(context);
            _this->mShellSessionManager.HandleDeviceConnected(exchangeMgr, sessionHandle);
            Platform::Delete(_this);
        }
        static void HandleDeviceConnectionFailure(void * context, const ScopedNodeId & peerId, CHIP_ERROR error)
        {
            ConnectionCallback * _this = static_cast<ConnectionCallback *>(context);
            _this->mShellSessionManager.HandleDeviceConnectionFailure(peerId, error);
            Platform::Delete(_this);
        }

        ShellSessionManager & mShellSessionManager;
        Callback::Callback<OnDeviceConnected> mOnConnectedCallback;
        Callback::Callback<OnDeviceConnectionFailure> mOnConnectionFailureCallback;
    };

    static ShellSessionManager sShellSessionManager;

    CHIP_ERROR EstablishConnection(const ScopedNodeId & nodeId);


    void HandleDeviceConnected(Messaging::ExchangeManager & exchangeMgr, const SessionHandle & sessionHandle);
    void HandleDeviceConnectionFailure(const ScopedNodeId & peerId, CHIP_ERROR error);

//    PendingNotificationMap mPendingNotificationMap;

    ShellSessionManagerInitParams mInitParams;

    // Used to keep track of synchronous failures from FindOrEstablishSession.
    CHIP_ERROR mLastSessionEstablishmentError;
};
}
