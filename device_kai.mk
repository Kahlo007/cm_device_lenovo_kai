$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lenovo/kai/device-vendor.mk)

# Settings
PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi
PRODUCT_DEVICE := kai
PRODUCT_NAME := cm_kai
DEVICE_PACKAGE_OVERLAYS += device/lenovo/kai/overlay

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    tf.enable=y \
    drm.service.enabled=true \
    ro.carrier=wifi-only

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
  LOCAL_KERNEL := kernel/tegra/arch/arm/boot/zImage
else
  LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

#PRODUCT_COPY_FILES += \
#    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp

include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

PRODUCT_COPY_FILES += \
    device/lenovo/kai/init.kai.rc:root/init.kai.rc \
    device/lenovo/kai/init.tf.rc:root/init.tf.rc \
    device/lenovo/kai/init.IdeaTabA2109A_board.usb.rc:root/init.IdeaTabA2109A_board.usb.rc

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

PRODUCT_COPY_FILES += \
    device/lenovo/kai/ft5x0x_ts.idc:system/usr/idc/ft5x0x_ts.idc \
    device/lenovo/kai/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# for bugmailer
PRODUCT_PACKAGES += send_bug
PRODUCT_COPY_FILES += \
    system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
    system/extras/bugmailer/send_bug:system/bin/send_bug

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_CHARACTERISTICS := tablet

# Build_Prob settings
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_kai
PRODUCT_DEVICE := kai

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

