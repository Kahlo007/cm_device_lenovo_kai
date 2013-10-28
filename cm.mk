## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := kai

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lenovo/kai/device_kai.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := kai
PRODUCT_NAME := cm_kai
PRODUCT_BRAND := lenovo
PRODUCT_MODEL := kai
PRODUCT_MANUFACTURER := lenovo
