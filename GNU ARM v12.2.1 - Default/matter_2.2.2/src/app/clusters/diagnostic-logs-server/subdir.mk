################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
CPP_SRCS += \
../matter_2.2.2/src/app/clusters/diagnostic-logs-server/diagnostic-logs-server.cpp 

OBJS += \
./matter_2.2.2/src/app/clusters/diagnostic-logs-server/diagnostic-logs-server.o 

CPP_DEPS += \
./matter_2.2.2/src/app/clusters/diagnostic-logs-server/diagnostic-logs-server.d 


# Each subdirectory must supply rules for building sources it contributes
matter_2.2.2/src/app/clusters/diagnostic-logs-server/diagnostic-logs-server.o: ../matter_2.2.2/src/app/clusters/diagnostic-logs-server/diagnostic-logs-server.cpp matter_2.2.2/src/app/clusters/diagnostic-logs-server/subdir.mk
	@echo 'Building file: $<'
	@echo 'Invoking: GNU ARM C++ Compiler'
	arm-none-eabi-g++ -g -gdwarf-2 -mcpu=cortex-m33 -mthumb -std=gnu++17 '-DCHIP_CRYPTO_PLATFORM=1' '-DNVM3_DEFAULT_MAX_OBJECT_SIZE=4092' '-DNVM3_DEFAULT_NVM_SIZE=40960' '-D_WANT_REENT_SMALL=1' '-DCHIP_ADDRESS_RESOLVE_IMPL_INCLUDE_HEADER=<lib/address_resolve/AddressResolve_DefaultImpl.h>' '-DCHIP_HAVE_CONFIG_H=1' '-DRADIO_CONFIG_DMP_SUPPORT=1' '-DCURRENT_TIME_NOT_IMPLEMENTED=1' '-DMBEDTLS_USER_CONFIG_FILE=<sli_psa_builtin_config.h>' '-DOPENTHREAD_CONFIG_DETERMINISTIC_ECDSA_ENABLE=0' '-DOPENTHREAD_CONFIG_ENABLE_BUILTIN_MBEDTLS=0' '-DCHIP_CONFIG_ENABLE_ICD_SERVER=1' '-DLCD_WITH_SLEEP=1' '-DSL_ICD_ENABLED=1' '-DDISPLAY_ENABLED=1' '-DSILABS_OTA_ENABLED=1' '-DQR_CODE_ENABLED=1' '-DENABLE_CHIP_SHELL=1' '-DOPENTHREAD_CONFIG_CLI_TRANSPORT=OT_CLI_TRANSPORT_CONSOLE' '-DSL_MATTER_CLI_ARG_PARSER=1' '-DCHIP_CONFIG_PERSIST_SUBSCRIPTIONS=1' '-DCHIP_CONFIG_SYNCHRONOUS_REPORTS_ENABLED=1' '-DCHIP_DEVICE_CONFIG_THREAD_ENABLE_CLI=1' '-DTIME_SYNC_ENABLE_TSC_FEATURE=0' '-DCONFIG_ENABLE_EUART=1' '-DEFR32MG24=1' '-DENABLE_WSTK_LEDS=1' '-DEFR32MG24B210F1536IM48=1' '-DSL_APP_PROPERTIES=1' '-DSL_BOARD_NAME="BRD4186C"' '-DSL_BOARD_REV="A01"' '-DHARDWARE_BOARD_DEFAULT_RF_BAND_2400=1' '-DHARDWARE_BOARD_SUPPORTS_1_RF_BAND=1' '-DHARDWARE_BOARD_SUPPORTS_RF_BAND_2400=1' '-DHFXO_FREQ=39000000' '-DconfigNUM_SDK_THREAD_LOCAL_STORAGE_POINTERS=2' '-DSL_COMPONENT_CATALOG_PRESENT=1' '-DMBEDTLS_CONFIG_FILE=<sl_mbedtls_config.h>' '-DOPENTHREAD_CORE_CONFIG_PLATFORM_CHECK_FILE="openthread-core-efr32-config-check.h"' '-DOPENTHREAD_PROJECT_CORE_CONFIG_FILE="openthread-core-efr32-config.h"' '-DOPENTHREAD_CONFIG_FILE="sl_openthread_generic_config.h"' '-DOPENTHREAD_MTD=1' '-DSL_OPENTHREAD_STACK_FEATURES_CONFIG_FILE="sl_openthread_features_config.h"' '-DMBEDTLS_PSA_CRYPTO_CONFIG_FILE=<psa_crypto_config.h>' '-DSL_RAIL_LIB_MULTIPROTOCOL_SUPPORT=1' '-DSL_RAIL_UTIL_PA_CONFIG_HEADER=<sl_rail_util_pa_config.h>' '-DRTT_USE_ASM=0' '-DSEGGER_RTT_SECTION="SEGGER_RTT"' '-DSL_OPENTHREAD_CUSTOM_CLI_ENABLE=1' '-DSLI_RADIOAES_REQUIRES_MASKING=1' -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\config" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\config\btconf" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\config\common" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\config\provision" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\autogen" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\include" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\examples\platform\silabs" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\include" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\lib" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\third_party\nlassert\repo\include" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\third_party\nlio\repo\include" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\lib\address_resolve" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\lib\dnssd" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\examples\platform\silabs\efr32" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\platform\silabs\efr32" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\include\platform" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\include\platform\internal" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\platform\logging" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\include\platform\internal\testing" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\platform\silabs" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\platform\OpenThread" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\platform\silabs\platformAbstraction" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\platform" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\platform\FreeRTOS" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\protocols\interaction_model" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\access\examples" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\access" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\lib\asn1" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\protocols\bdx" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\ble" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\server" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\controller" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\lib\core" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\crypto" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\reporting" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\MessageDef" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\protocols\echo" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\protocols\user_directed_commissioning" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\protocols" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\protocols\secure_channel" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\credentials\examples" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\credentials\tests" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\credentials" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\credentials\attestation_verifier" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\inet" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\examples\providers" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\messaging" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\examples\common\QRCode\repo\c" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\transport\raw" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\setup_payload" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\lib\support\logging" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\lib\support" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\lib\support\verhoeff" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\system" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\transport" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\clusters\basic-information" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\clusters\bindings" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\clusters\diagnostic-logs-server" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\clusters\general-commissioning-server" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\clusters\general-diagnostics-server" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\clusters\groups-server" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\icd" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\clusters\icd-management-server" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\clusters\identify-server" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\slc\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\examples\platform\silabs\display" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\clusters\network-commissioning" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\clusters\ota-requestor" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\examples\platform\silabs\provision" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\lib\shell" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\lib\shell\commands" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\examples\shell\shell_common\include" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\clusters\software-diagnostics-server" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\clusters\switch-server" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\app\clusters\time-synchronization-server" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\matter_2.2.2\src\tracing" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\Device\SiliconLabs\EFR32MG24\Include" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\common\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\protocol\bluetooth\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\protocol\bluetooth\bgstack\ll\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\hardware\board\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\bootloader" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\bootloader\api" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\driver\button\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\CMSIS\Core\Include" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\CMSIS\RTOS2\Include" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\service\device_init\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\emdrv\dmadrv\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\middleware\glib\dmd" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\middleware\glib" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\emdrv\common\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\emlib\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\third_party\freertos\cmsis\Include" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\third_party\freertos\kernel\include" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\third_party\freertos\kernel\portable\GCC\ARM_CM33_NTZ\non_secure" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\middleware\glib\glib" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\emdrv\gpiointerrupt\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\service\hfxo_manager\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\service\iostream\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\driver\leddrv\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\hardware\driver\memlcd\src\ls013b7dh03" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\security\sl_component\sl_mbedtls_support\config" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\security\sl_component\sl_mbedtls_support\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\third_party\mbedtls\include" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\third_party\mbedtls\library" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\hardware\driver\memlcd\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\hardware\driver\memlcd\inc\memlcd_usart" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\service\mpu\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\hardware\driver\mx25_flash_shutdown\inc\sl_mx25_flash_shutdown_usart" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\emdrv\nvm3\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\third_party\openthread\src" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\third_party\openthread\src\cli" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\third_party\openthread\include" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\third_party\openthread\include\openthread" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\third_party\openthread\src\core" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\third_party\openthread\src\lib" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\third_party\openthread\third_party\tcplp" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\third_party\openthread\examples\platforms" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\third_party\openthread\examples\platforms\utils" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\protocol\openthread\platform-abstraction\efr32" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\protocol\openthread\platform-abstraction\include" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\peripheral\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\service\power_manager\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\security\sl_component\sl_psa_driver\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\radio\rail_lib\common" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\radio\rail_lib\protocol\ble" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\radio\rail_lib\protocol\ieee802154" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\radio\rail_lib\protocol\wmbus" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\radio\rail_lib\protocol\zwave" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\radio\rail_lib\chip\efr32\efr32xg2x" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\radio\rail_lib\protocol\sidewalk" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\radio\rail_lib\plugin\rail_util_built_in_phys\efr32xg24" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\radio\rail_lib\plugin\pa-conversions" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\radio\rail_lib\plugin\pa-conversions\efr32xg24" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\radio\rail_lib\plugin\rail_util_power_manager_init" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\radio\rail_lib\plugin\rail_util_pti" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\radio\rail_lib\plugin\rail_util_rssi" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\security\sl_component\se_manager\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\security\sl_component\se_manager\src" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\plugin\security_manager" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\third_party\segger\systemview\SEGGER" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\util\silicon_labs\silabs_core\memory_manager" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\common\toolchain\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\protocol\openthread\include" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\service\system\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\service\sleeptimer\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\security\sl_component\sl_protocol_crypto\src" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\emdrv\uartdrv\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\gecko_sdk_4.4.3\platform\service\udelay\inc" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\autogen\zap-generated" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\autogen\zap-generated\app-common\zap-generated" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\autogen\zap-generated\app-common\zap-generated\attributes" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\autogen\zap-generated\app-common\zap-generated\ids" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\autogen\zap-generated\app" -I"C:\Users\alji\SimplicityStudio\v5_workspace\MatterLightSwitchOverThread_brd4186c_v442\autogen\zap-generated\attributes" -Os -Wall -Wextra -ffunction-sections -fdata-sections -imacrossl_openthread_ble_cli_config.h -imacrossl_gcc_preinclude.h -mfpu=fpv5-sp-d16 -mfloat-abi=hard -fno-rtti -fno-exceptions -Wno-deprecated-declarations -Wno-maybe-uninitialized -Wno-missing-field-initializers -Wno-unused-parameter -Wno-cast-function-type -Wno-psabi -fno-strict-aliasing -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-common -Werror=unused-variable -Werror=unused-function -Wno-sign-compare -mcmse --specs=nano.specs -c -fmessage-length=0 -MMD -MP -MF"matter_2.2.2/src/app/clusters/diagnostic-logs-server/diagnostic-logs-server.d" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


