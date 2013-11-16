$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lenovo/kai/device-vendor.mk)
$(call inherit-product, device/lenovo/kai/device-common.mk)
# Settings
PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi
PRODUCT_DEVICE := kai
PRODUCT_NAME := cm_kai
DEVICE_PACKAGE_OVERLAYS += \
    device/lenovo/kai/overlay

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=20 \
    tf.enable=y \
    drm.service.enabled=true \
    ro.carrier=wifi-only



$(call inherit-product, build/target/product/full.mk)




PRODUCT_COPY_FILES += \
    device/lenovo/kai/init.kai.rc:root/init.kai.rc \
    device/lenovo/kai/fstab.kai:root/fstab.kai \
    device/lenovo/kai/init.tf.rc:root/init.tf.rc \
    device/lenovo/kai/init.IdeaTabA2109A_board.usb.rc:root/init.IdeaTabA2109A_board.usb.rc


PRODUCT_COPY_FILES += \
    device/lenovo/kai/ft5x0x_ts.idc:system/usr/idc/ft5x0x_ts.idc \
    device/lenovo/kai/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl


