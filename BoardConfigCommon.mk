##+new
# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
#WIFI_DRIVER_MODULE_NAME	:= "bcmdhd"
#WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/bcm4330/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/bcm4330/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/vendor/firmware/bcm4330/fw_bcmdhd_p2p.bin"
##-new

##+new
# Misc display settings
BOARD_USE_SKIA_LCDTEXT := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true
##-new

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
##+new
BOARD_BLUEDROID_VENDOR_CONF := device/lenovo/kai/bluetooth/vnd_kai.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lenovo/kai/bluetooth

# Use Cortex A9 optimizations for A7
USE_ALL_OPTIMIZED_STRING_FUNCS := true


ifneq ($(HAVE_NVIDIA_PROP_SRC),false)
# needed for source compilation of nvidia libraries
-include vendor/nvidia/proprietary_src/build/definitions.mk
-include vendor/nvidia/build/definitions.mk
endif

# Audio Options

BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := false

# EGL
BOARD_USES_HGL := true
BOARD_EGL_NEEDS_LEGACY_FB := true
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/lenovo/kai/egl.cfg

BOARD_SEPOLICY_DIRS += \
	device/lenovo/kai/sepolicy

BOARD_SEPOLICY_UNION += \
	file_contexts \
	genfs_contexts \
	app.te \
	device.te \
	drmserver.te \
	file.te \
	gpsd.te \
	init_shell.te \
	keystore.te \
	mediaserver.te \
	rild.te \
	sensors_kai.te \
	surfaceflinger.te \
	system.te \
	zygote.te \
        btmacreader.te

# Turn on Cortex A9 Optimizations for A7
TARGET_EXTRA_CFLAGS := $(call cc-option,-mtune=cortex-a9) $(call cc-option,-mcpu=cortex-a9)

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := tegra3
TARGET_TEGRA_VERSION := t30
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
ARCH_ARM_HAVE_TLS_REGISTER := true
# Storage and Kernel
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 681574400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6567231488
BOARD_FLASH_BLOCK_SIZE := 4096
TARGET_BOOTLOADER_BOARD_NAME := kai
BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048
TARGET_PREBUILT_KERNEL := device/lenovo/kai/zimage
TARGET_KERNEL_SOURCE := kernel/lenovo/kai
TARGET_KERNEL_CONFIG := tegra3_kai2_defconfig
NEED_WORKAROUND_CORTEX_A9_745320 := true
BOARD_USES_GENERIC_INVENSENSE := false
ARCH_ARM_USE_NON_NEON_MEMCPY := true


