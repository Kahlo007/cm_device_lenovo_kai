#
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_COPY_FILES += \
    device/lenovo/kai/init.kai.rc:root/init.kai.rc \
    device/lenovo/kai/fstab.kai:root/fstab.kai \
    device/lenovo/kai/init.tf.rc:root/init.tf.rc \
    device/lenovo/kai/init.IdeaTabA2109A_board.usb.rc:root/init.IdeaTabA2109A_board.usb.rc



include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk
### for bugmailer
##PRODUCT_PACKAGES += send_bug
##PRODUCT_COPY_FILES += \
##    system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
##    system/extras/bugmailer/send_bug:system/bin/send_bug

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_CHARACTERISTICS := tablet

# Build_Prob settings
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_kai
PRODUCT_DEVICE := kai

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
  LOCAL_KERNEL := device/lenovo/kai/zImage
else
  LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

#PRODUCT_COPY_FILES += \
#    $(LOCAL_KERNEL):kernel
##+new
PRODUCT_PACKAGES := \
    audio.a2dp.default \
    power.kai \
    audio.usb.default \
    hwcomposer.tegra \
    librs_jni \
    setup_fs \
    l2ping \
    hcitool \
    NvCPLSvc \
    libnetcmdiface


##PRODUCT_PACKAGES += \
    keystore.kai

# Tegra 3 spacific overrides
PRODUCT_PROPERTY_OVERRIDES += \
    persist.tegra.nvmmlite=1 \
    persist.sys.NV_FPSLIMIT=0 \
    ro.sf.override_null_lcd_density = 1 \
    keyguard.no_require_sim=true
##-new

# media config xml file
PRODUCT_COPY_FILES += \
    device/lenovo/kai/media_profiles.xml:system/etc/media_profiles.xml

# media codec config xml file
PRODUCT_COPY_FILES += \
    device/lenovo/kai/media_codecs.xml:system/etc/media_codecs.xml

# Bluetooth config file
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.le.conf:system/etc/bluetooth/main.conf \

# audio mixer paths
#PRODUCT_COPY_FILES += \
    device/lenovo/kai/mixer_paths.xml:system/etc/mixer_paths.xml

# audio policy configuration
PRODUCT_COPY_FILES += \
    device/lenovo/kai/audio_policy.conf:system/etc/audio_policy.conf

WIFI_BAND := 802_11_BG
 $(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
ifneq ($(TARGET_PREBUILT_WIFI_MODULE),)
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_WIFI_MODULE):system/lib/modules/bcmdhd.ko
endif

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml

