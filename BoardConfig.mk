USE_CAMERA_STUB := true
TARGET_RECOVERY_UI_LIB := librecovery_ui_kai
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_FSTAB := device/lenovo/kai/fstab.kai
## BOARD_LIB_DUMPSTATE := libdumpstate.kai
# inherit from the proprietary version
-include vendor/lenovo/kai/BoardConfigVendor.mk
include device/lenovo/kai/BoardConfigCommon.mk
# General Board settings

BOARD_HAS_NO_SELECT_BUTTON := true
## BOARD_HAS_SDCARD_INTERNAL := true
USE_PROPRIETARY_AUDIO_EXTENSIONS := true
