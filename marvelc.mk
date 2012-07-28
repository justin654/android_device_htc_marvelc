#
# Copyright (C) 2009 The Android Open Source Project
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
$(call inherit-product, build/target/product/full_base.mk)
$(call inherit-product, build/target/product/languages_full.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# dalvik heap config for devices with 512MB memory
$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/marvelc/media_a1026.mk)

DEVICE_PACKAGE_OVERLAYS := device/htc/marvelc/overlay

# Carrier Info
CDMA_GOOGLE_BASE := android-sprint-us
CDMA_CARRIER_ALPHA := Virgin_Mobile
CDMA_CARRIER_NUMERIC := 311490

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/marvelc/key/marvelc-keypad.kl:system/usr/keylayout/marvelc-keypad.kl \
    device/htc/marvelc/key/marvelc-keypad.kcm.bin:system/usr/keychars/marvelc-keypad.kcm.bin \
    device/htc/marvelc/key/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/marvelc/key/cy8c-touchscreen.kl:system/usr/keylayout/cy8c-touchscreen.kl

PRODUCT_COPY_FILES += \
    device/htc/marvelc/ueventd.marvelc.rc:root/ueventd.marvelc.rc \
    device/htc/marvelc/init.marvelc.usb.rc:root/init.marvelc.usb.rc \
    device/htc/marvelc/init.marvelc.rc:root/init.marvelc.rc

# Property Overides for carrier
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(CDMA_GOOGLE_BASE) \
    ro.cdma.home.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    ro.cdma.home.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.sim.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.sim.operator.numeric=$(CDMA_CARRIER_NUMERIC) \
    gsm.operator.alpha=$(CDMA_CARRIER_ALPHA) \
    gsm.operator.numeric=$(CDMA_CARRIER_NUMERIC)

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface = wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.sf.lcd_density = 160 \
    ro.opengles.version=131072 \
    ro.htc.camerahack=msm7k\
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.def.agps.mode=2 \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2 \
    ro.ril.disable.fd.plmn.prefix=23402,23410,23411 \
    ro.telephony.ril.v3=signalstrength,skipbrokendatacall \
    ro.ril.oem.ecclist=911 \
    ro.ril.set.mtusize=1472 \
    ro.ril.disable.power.collapse = 1 \
    ro.ril.avoid.pdp.overlap = 1 \
    ro.ril.hsxpa=1 \
    ro.ril.gprsclass=10 \
    ro.ril.hep=1 \
    ro.ril.enable.dtm=0 \
    ro.ril.hsdpa.category=8 \
    ro.ril.enable.a53=1 \
    ro.ril.enable.3g.prefix=1 \
    ro.ril.htcmaskw1.bitmask=4294967295 \
    ro.ril.htcmaskw1=14449 \
    ro.ril.hsupa.category=6 \
    ro.ril.hep = 1 \
    ro.ril.hsdpa.category = 8 \
    ro.telephony.default_network = 4 \
    ro.ril.enable.amr.wideband = 1 \
    ro.cdma.voicemail.number=mine

$(call inherit-product-if-exists, vendor/htc/marvelc/marvelc-vendor.mk)

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/marvelc/media_profiles.xml:system/etc/media_profiles.xml

# device specific
PRODUCT_PACKAGES += \
    lights.marvelc \
    sensors.marvelc \
    gps.marvelc \
    camera.marvelc \
    audio.a2dp.default \
    audio.primary.marvelc \
    audio_policy.marvelc

# camera
PRODUCT_PACKAGES += \
    libcamera \
    camera.msm7x27

# gpu
PRODUCT_PACKAGES += \
    gralloc.msm7x27 \
    copybit.msm7x27 \
    hwcomposer.default \
    hwcomposer.msm7x27

# audio
PRODUCT_PACKAGES += \
    libtinyalsa \
    libaudioutils

# OMX
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libOmxCore \
    libdivxdrmecrypt \
    libmm-omxcore

# live wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    VisualizationWallpapers \
    NoiseField \
    PhaseBeam \
    MagicSmoke \
    Galaxy4 \
    HoloSpiralWallpaper \
    librs_jni

# missing packages
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    Superuser \
    Torch \
    Provision \
    bash \
    nano \
    FileManager

PRODUCT_COPY_FILES += \
    device/htc/marvelc/vold.fstab:system/etc/vold.fstab \
    device/htc/marvelc/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/marvelc/idc/atmel-touchscreen.idc:system/usr/idc/cy8c-touchscreen.idc

# Prebuilt modules or firmware
PRODUCT_COPY_FILES += \
    device/htc/marvelc/prebuilt/system/etc/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/marvelc/prebuilt/system/etc/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    device/htc/marvelc/prebuilt/system/etc/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin

# Goo-app support
PRODUCT_PACKAGES += \
GooManager

# Goo updater app
PRODUCT_PROPERTY_OVERRIDES += \
ro.goo.developerid=simonsimons34 \
ro.goo.rom=cm9 \
ro.goo.version=3

PRODUCT_NAME := htc_marvelc
PRODUCT_DEVICE := marvelc
