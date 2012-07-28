# Boot animation
TARGET_BOOTANIMATION_NAME := vertical-320x480

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)
$(call inherit-product, vendor/cm/config/cdma.mk)

# Inherit device configuration
$(call inherit-product, device/htc/marvelc/marvelc.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := marvelc
PRODUCT_NAME := htc_marvelc
PRODUCT_BRAND := HTC
PRODUCT_MODEL := Marvelc
PRODUCT_MANUFACTURER := HTC

# CM_RELEASE := true
CM_BUILDTYPE := UNOFFICIAL

# Set build fingerprint
BUILD_FINGERPRINT=cyanogenmod/htc_marvelc/marvelc:4.0.4/ss34
