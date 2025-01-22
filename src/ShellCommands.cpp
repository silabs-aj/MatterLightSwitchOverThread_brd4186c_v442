/*
 *
 *    Copyright (c) 2020 Project CHIP Authors
 *    Copyright (c) 2018 Nest Labs, Inc.
 *    All rights reserved.
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
#if defined(ENABLE_CHIP_SHELL)

#include "ShellCommands.h"
#include "ShellSessionManager.h"
#include "BindingHandler.h"
#include <app/util/binding-table.h>
#include <app/clusters/bindings/BindingManager.h>
#include <app/clusters/bindings/bindings.h>
#include <lib/shell/Engine.h>
#include <app/InteractionModelEngine.h>
#include <lib/shell/commands/Help.h>
#include <platform/CHIPDeviceLayer.h>
#include "../matter_2.2.2/src/app/server/Server.h"
#include "../matter_2.2.2/src/app/CASESessionManager.h"
#include "../matter_2.2.2/src/controller/ReadInteraction.h"

using namespace chip;
using namespace chip::app;

namespace LightSwtichCommands {

using Shell::Engine;
using Shell::shell_command_t;
using Shell::streamer_init;
using Shell::streamer_get;
using Shell::streamer_printf;

Engine sShellSwitchSubCommands;
Engine sShellSwitchOnOffSubCommands;

Engine sShellSwitchGroupsSubCommands;
Engine sShellSwitchGroupsOnOffSubCommands;
Engine sShellSwitchSubscribeSubCommands;

Engine sShellSwitchBindingSubCommands;
Engine sShellSwitchLevelControlSubCommands;

/********************************************************
 * Switch shell functions
 *********************************************************/

CHIP_ERROR SwitchHelpHandler(int argc, char ** argv)
{
    sShellSwitchSubCommands.ForEachCommand(Shell::PrintCommandHelp, nullptr);
    return CHIP_NO_ERROR;
}

CHIP_ERROR BindingTableBrowseHandler(int argc,char ** argv)
{
    streamer_init(streamer_get());


//    streamer_printf(streamer_get(), "hello binding reader\n");
//    auto table = BindingTable :: GetInstance().LoadStorage();
    BindingTable :: GetInstance().LoadFromStorage();

//    auto node = BindingTable :: GetInstance().GetAt(0).nodeId;
//    streamer_printf(streamer_get(), "nodeid =  %d\n", node);

    for (const EmberBindingTableEntry & entry : BindingTable::GetInstance())
    {
        streamer_printf(streamer_get(), "NodeId =  %d\n", entry.nodeId);
        streamer_printf(streamer_get(), "ClusterId = %d\n",entry.clusterId.Value());
        streamer_printf(streamer_get(), "EndpointId = %d\n",entry.local);
        streamer_printf(streamer_get(), "FabricIndex =  %d\n", entry.fabricIndex);
    } 

    return CHIP_NO_ERROR;
}

CHIP_ERROR  SwitchCommandHandler(int argc, char ** argv)
{
    if (argc == 0)
    {
        return SwitchHelpHandler(argc, argv);
    }

    return sShellSwitchSubCommands.ExecCommand(argc, argv);
}

/********************************************************
 * OnOff switch shell functions
 *********************************************************/

CHIP_ERROR OnOffHelpHandler(int argc, char ** argv)
{
    sShellSwitchOnOffSubCommands.ForEachCommand(Shell::PrintCommandHelp, nullptr);
    return CHIP_NO_ERROR;
}

CHIP_ERROR OnOffSwitchCommandHandler(int argc, char ** argv)
{
    if (argc == 0)
    {
        return OnOffHelpHandler(argc, argv);
    }

    return sShellSwitchOnOffSubCommands.ExecCommand(argc, argv);
}

CHIP_ERROR OnSwitchCommandHandler(int argc, char ** argv)
{
    BindingCommandData * data = Platform::New<BindingCommandData>();
    data->commandId           = Clusters::OnOff::Commands::On::Id;
    data->clusterId           = Clusters::OnOff::Id;

    DeviceLayer::PlatformMgr().ScheduleWork(SwitchWorkerFunction, reinterpret_cast<intptr_t>(data));
    return CHIP_NO_ERROR;
}

CHIP_ERROR OffSwitchCommandHandler(int argc, char ** argv)
{
    BindingCommandData * data = Platform::New<BindingCommandData>();
    data->commandId           = Clusters::OnOff::Commands::Off::Id;
    data->clusterId           = Clusters::OnOff::Id;

    DeviceLayer::PlatformMgr().ScheduleWork(SwitchWorkerFunction, reinterpret_cast<intptr_t>(data));
    return CHIP_NO_ERROR;
}

CHIP_ERROR ToggleSwitchCommandHandler(int argc, char ** argv)
{
    BindingCommandData * data = Platform::New<BindingCommandData>();
    data->commandId           = Clusters::OnOff::Commands::Toggle::Id;
    data->clusterId           = Clusters::OnOff::Id;

    DeviceLayer::PlatformMgr().ScheduleWork(SwitchWorkerFunction, reinterpret_cast<intptr_t>(data));
    return CHIP_NO_ERROR;
}

/********************************************************
 * bind switch shell functions
 *********************************************************/

CHIP_ERROR BindingHelpHandler(int argc, char ** argv)
{
    sShellSwitchBindingSubCommands.ForEachCommand(Shell::PrintCommandHelp, nullptr);
    return CHIP_NO_ERROR;
}

CHIP_ERROR BindingSwitchCommandHandler(int argc, char ** argv)
{
    if (argc == 0)
    {
        return BindingHelpHandler(argc, argv);
    }

    return sShellSwitchBindingSubCommands.ExecCommand(argc, argv);
}

CHIP_ERROR BindingGroupBindCommandHandler(int argc, char ** argv)
{
    VerifyOrReturnError(argc == 2, CHIP_ERROR_INVALID_ARGUMENT);

    EmberBindingTableEntry * entry = Platform::New<EmberBindingTableEntry>();
    entry->type                    = EMBER_MULTICAST_BINDING;
    entry->fabricIndex             = atoi(argv[0]);
    entry->groupId                 = atoi(argv[1]);
    entry->local                   = 1; // Hardcoded to endpoint 1 for now
    entry->clusterId.SetValue(6);       // Hardcoded to OnOff cluster for now

    DeviceLayer::PlatformMgr().ScheduleWork(BindingWorkerFunction, reinterpret_cast<intptr_t>(entry));
    return CHIP_NO_ERROR;
}

CHIP_ERROR BindingUnicastBindCommandHandler(int argc, char ** argv)
{
    VerifyOrReturnError(argc == 3, CHIP_ERROR_INVALID_ARGUMENT);

    EmberBindingTableEntry * entry = Platform::New<EmberBindingTableEntry>();
    entry->type                    = EMBER_UNICAST_BINDING;
    entry->fabricIndex             = atoi(argv[0]);
    entry->nodeId                  = atoi(argv[1]);
    entry->local                   = 1; // Hardcoded to endpoint 1 for now
    entry->remote                  = atoi(argv[2]);
    entry->clusterId.SetValue(6); // Hardcode to OnOff cluster for now

    DeviceLayer::PlatformMgr().ScheduleWork(BindingWorkerFunction, reinterpret_cast<intptr_t>(entry));
    return CHIP_NO_ERROR;
}

/********************************************************
 * Groups switch shell functions
 *********************************************************/

CHIP_ERROR GroupsHelpHandler(int argc, char ** argv)
{
    sShellSwitchGroupsSubCommands.ForEachCommand(Shell::PrintCommandHelp, nullptr);
    return CHIP_NO_ERROR;
}

CHIP_ERROR GroupsSwitchCommandHandler(int argc, char ** argv)
{
    if (argc == 0)
    {
        return GroupsHelpHandler(argc, argv);
    }

    return sShellSwitchGroupsSubCommands.ExecCommand(argc, argv);
}

/********************************************************
 * Groups OnOff switch shell functions
 *********************************************************/

CHIP_ERROR GroupsOnOffHelpHandler(int argc, char ** argv)
{
    sShellSwitchGroupsOnOffSubCommands.ForEachCommand(Shell::PrintCommandHelp, nullptr);
    return CHIP_NO_ERROR;
}

CHIP_ERROR GroupsOnOffSwitchCommandHandler(int argc, char ** argv)
{
    if (argc == 0)
    {
        return GroupsOnOffHelpHandler(argc, argv);
    }

    return sShellSwitchGroupsOnOffSubCommands.ExecCommand(argc, argv);
}

CHIP_ERROR GroupOnSwitchCommandHandler(int argc, char ** argv)
{
    BindingCommandData * data = Platform::New<BindingCommandData>();
    data->commandId           = Clusters::OnOff::Commands::On::Id;
    data->clusterId           = Clusters::OnOff::Id;
    data->isGroup             = true;

    DeviceLayer::PlatformMgr().ScheduleWork(SwitchWorkerFunction, reinterpret_cast<intptr_t>(data));
    return CHIP_NO_ERROR;
}

CHIP_ERROR GroupOffSwitchCommandHandler(int argc, char ** argv)
{
    BindingCommandData * data = Platform::New<BindingCommandData>();
    data->commandId           = Clusters::OnOff::Commands::Off::Id;
    data->clusterId           = Clusters::OnOff::Id;
    data->isGroup             = true;

    DeviceLayer::PlatformMgr().ScheduleWork(SwitchWorkerFunction, reinterpret_cast<intptr_t>(data));
    return CHIP_NO_ERROR;
}

CHIP_ERROR GroupToggleSwitchCommandHandler(int argc, char ** argv)
{
    BindingCommandData * data = Platform::New<BindingCommandData>();
    data->commandId           = Clusters::OnOff::Commands::Toggle::Id;
    data->clusterId           = Clusters::OnOff::Id;
    data->isGroup             = true;

    DeviceLayer::PlatformMgr().ScheduleWork(SwitchWorkerFunction, reinterpret_cast<intptr_t>(data));
    return CHIP_NO_ERROR;
}

/** Snippet on Binding table access

   BindingTable :: GetInstance().LoadFromStorage();

    auto node = BindingTable :: GetInstance().GetAt(0).nodeId;
    streamer_printf(streamer_get(), "nodeid =  %d\n", node);

  for (const EmberBindingTableEntry & entry: BindingTable::GetInstance())
  {
      streamer_printf(streamer_get(), "nodeid =  %d\n", entry.nodeId);
      streamer_printf(streamer_get(), "fabricindex =  %d\n", entry.fabricIndex);
  }


   BindingManager BindingMgr = chip::BindingManager::GetInstance();
  CASESessionManager caseSessionMgr = chip::Server::GetInstance().GetCASESessionManager();

  const EmberBindingTableEntry & entry = BindingTable :: GetInstance().GetAt(0);

    ScopedNodeId peerNode = ScopedNodeId(entry.nodeId,entry.fabricIndex);

    BindingMgr.UnicastBindingCreated(entry.fabricIndex,entry.nodeId);

    streamer_printf(streamer_get(),"argv input: %s\n", (argv[0]));
    streamer_printf(streamer_get(),"argv input: %s\n", *(argv[1]));
    streamer_printf(streamer_get(),"argv input: %s\n", *(argv[2]));
    streamer_printf(streamer_get(),"argv input: %s\n", *(argv[3]));

    while(count < argc){
          error = streamer_init(streamer_get());
          streamer_printf(streamer_get(),"argv input: %s\n", *(argv[count]));
          count++;
      }
 */



//  chip::Messaging::ExchangeManager * exchangeMgr;
//  chip::SessionHandle * sessionHandle;

/*
  streamer_printf(streamer_get(), "\narg nums  = %d",argc);

  uint8_t i;

  for(i=0;i<argc;i++){
      streamer_printf(streamer_get(), "\narg %d = %d",i,atoi(argv[i]));
  }
*/


CHIP_ERROR SubscribeHandler(int argc,char **argv)
{

  VerifyOrReturnError(argc == 7, CHIP_ERROR_INVALID_ARGUMENT);
  int error = streamer_init(streamer_get());
  streamer_printf(streamer_get(), "\nAcquire Stream:%s",error == 0 ? "Success" : "Failure");


  auto & server = chip::Server::GetInstance();

  app::ConcreteAttributePath attrPath = {atoi(argv[2]),atoi(argv[3]),atoi(argv[4])};
  chip::ShellSessionManagerInitParams params = {atoi(argv[0]),atoi(argv[1]),attrPath,atoi(argv[5]),atoi(argv[6]),&server.GetFabricTable(), server.GetCASESessionManager()};

  chip::ShellSessionManager::GetInstance().Init(params);

      return CHIP_NO_ERROR;
 }

CHIP_ERROR LevelControlCommandHandler(int argc, char ** argv)
{

  int error = streamer_init(streamer_get());
   streamer_printf(streamer_get(), "\nAcquire Stream:%s",error == 0 ? "Success" : "Failure");

   BindingCommandData * data = Platform::New<BindingCommandData>();
       data->commandId           = Clusters::LevelControl::Commands::Step::Id;
       data->clusterId           = Clusters::LevelControl::Id;


       data->isGroup             = false;

       DeviceLayer::PlatformMgr().ScheduleWork(SwitchWorkerFunction, reinterpret_cast<intptr_t>(data));
       return CHIP_NO_ERROR;



//   return sShellSwitchLevelControlSubCommands.ExecCommand(argc, argv);
}

CHIP_ERROR SubscribeHelpHandler(int argc, char ** argv)
{
    sShellSwitchSubscribeSubCommands.ForEachCommand(Shell::PrintCommandHelp, nullptr);
    return CHIP_NO_ERROR;
}

CHIP_ERROR LevelControlHelpHandler(int argc, char ** argv)
{
    sShellSwitchLevelControlSubCommands.ForEachCommand(Shell::PrintCommandHelp, nullptr);
    return CHIP_NO_ERROR;
}



/**
 * @brief configures switch matter shell
 */
void RegisterSwitchCommands()
{
    static const shell_command_t sSwitchSubCommands[] = {
        { &SwitchHelpHandler, "help", "Usage: switch <subcommand>" },
        { &OnOffSwitchCommandHandler, "onoff", " Usage: switch onoff <subcommand>" },
        { &LevelControlCommandHandler, "level-control", "Usage: switch level-control <node id> <endpoint>" },
        { &GroupsSwitchCommandHandler, "groups", "Usage: switch groups <subcommand>" },
        { &BindingSwitchCommandHandler, "binding", "Usage: switch binding <subcommand>" },
        { &SubscribeHandler, "subscribe", "Usage: switch subscribe  <node id> <endpoint>" },

    };

    static const shell_command_t sSwitchOnOffSubCommands[] = {
        { &OnOffHelpHandler, "help", "Usage : switch ononff <subcommand>" },
        { &OnSwitchCommandHandler, "on", "Sends on command to bound lighting app" },
        { &OffSwitchCommandHandler, "off", "Sends off command to bound lighting app" },
        { &ToggleSwitchCommandHandler, "toggle", "Sends toggle command to bound lighting app" }
    };

    static const shell_command_t sSwitchGroupsSubCommands[] = { { &GroupsHelpHandler, "help", "Usage: switch groups <subcommand>" },
                                                                { &GroupsOnOffSwitchCommandHandler, "onoff",
                                                                  "Usage: switch groups onoff <subcommand>" } };

    static const shell_command_t sSwitchGroupsOnOffSubCommands[] = {
        { &GroupsOnOffHelpHandler, "help", "Usage: switch groups onoff <subcommand>" },
        { &GroupOnSwitchCommandHandler, "on", "Sends on command to bound group" },
        { &GroupOffSwitchCommandHandler, "off", "Sends off command to bound group" },
        { &GroupToggleSwitchCommandHandler, "toggle", "Sends toggle command to group" }
    };

    static const shell_command_t sSwitchBindingSubCommands[] = {
        { &BindingTableBrowseHandler,"browse","Browse Binding table"},
        { &BindingHelpHandler, "help", "Usage: switch binding <subcommand>" },
        { &BindingGroupBindCommandHandler, "group", "Usage: switch binding group <fabric index> <group id>" },
        { &BindingUnicastBindCommandHandler, "unicast", "Usage: switch binding group <fabric index> <node id> <endpoint>" }
    };

    static const shell_command_t sSwitchSubscribeSubCommands[] = {
            { &SubscribeHelpHandler,"help","switch subscribe help"},
            { &SubscribeHandler, "subscribe", "Usage: switch subscribe  <node id> <endpoint>" }
        };

    static const shell_command_t sLevelControlCommand[] = {
            { &LevelControlCommandHandler, "step", "Usage: switch level-control <subcommand>" },
            { &LevelControlHelpHandler,"help","Usage switch level-control help "}};

    static const shell_command_t sSwitchCommand = { &SwitchCommandHandler, "switch",
                                                    "Light-switch commands. Usage: switch <subcommand>" };




    sShellSwitchGroupsOnOffSubCommands.RegisterCommands(sSwitchGroupsOnOffSubCommands, ArraySize(sSwitchGroupsOnOffSubCommands));
    sShellSwitchOnOffSubCommands.RegisterCommands(sSwitchOnOffSubCommands, ArraySize(sSwitchOnOffSubCommands));
    sShellSwitchGroupsSubCommands.RegisterCommands(sSwitchGroupsSubCommands, ArraySize(sSwitchGroupsSubCommands));
    sShellSwitchBindingSubCommands.RegisterCommands(sSwitchBindingSubCommands, ArraySize(sSwitchBindingSubCommands));
    sShellSwitchSubCommands.RegisterCommands(sSwitchSubCommands, ArraySize(sSwitchSubCommands));
    sShellSwitchSubscribeSubCommands.RegisterCommands(sSwitchSubscribeSubCommands, ArraySize(sSwitchSubscribeSubCommands));
    sShellSwitchLevelControlSubCommands.RegisterCommands(sLevelControlCommand,ArraySize(sLevelControlCommand));

    Engine::Root().RegisterCommands(&sSwitchCommand, 1);
}

} // namespace LightSwtichCommands

#endif // ENABLE_CHIP_SHELL
