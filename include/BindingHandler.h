/*
 *
 *    Copyright (c) 2020 Project CHIP Authors
 *
 *    Licensed under the Apache License, Version 2.0 (the "License");
 *    you may not use this file except in compliance with the License.
 *    You may obtain a copy of the License at
 *
 *        http://www.apache.org/licenses/LICENSE-2.0
 *
 *    Unless required by applicable law or agreed to in writing, software
 *    distributed under the License is distributed on an "AS IS" BASIS,
 *    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *    See the License for the specific language governing permissions and
 *    limitations under the License.
 */
#pragma once

#include "app-common/zap-generated/ids/Clusters.h"
#include "app-common/zap-generated/ids/Commands.h"
#include "app-common/zap-generated/cluster-objects.h"
#include "lib/core/CHIPError.h"
#include "../matter_2.2.2/src/messaging/ExchangeMgr.h"
#include "../matter_2.2.2/src/transport/Session.h"

CHIP_ERROR InitBindingHandler();
void SwitchWorkerFunction(intptr_t context);
void BindingWorkerFunction(intptr_t context);

struct BindingCommandData
{
    chip::EndpointId localEndpointId = 1;
    chip::CommandId commandId;
    chip::ClusterId clusterId;
    bool isGroup = false;
};

struct SubscribeData
{
  chip::EndpointId localEndpointId;
  chip::ClusterId clusterId;
  chip::Messaging::ExchangeManager * exchangeMgr;
  chip::SessionHandle * sessionHandle;
};
