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

DEVICE_PACKAGE_OVERLAYS := device/htc/marvelc/overlay

$(call inherit-product, vendor/cyanogen/products/bcm_fm_radio.mk)
$(call inherit-product, vendor/cyanogen/products/common_full_no_themes.mk)
$(call inherit-product, device/common/gps/gps_us.mk)
$(call inherit-product, device/htc/marvelc/media_a1026.mk)
$(call inherit-product, device/htc/common/common.mk)
$(call inherit-product, build/target/product/full_base.mk)

#Boot Animation MDPI
PRODUCT_COPY_FILES += \
    vendor/cyanogen/prebuilt/mdpi/media/bootanimation.zip:system/media/bootanimation.zip

# Call the vendor folder
$(call inherit-product-if-exists, vendor/htc/marvelc/marvelc-vendor.mk)

#CDMA APN's not in vendor
PRODUCT_COPY_FILES += \
    device/htc/marvelc/prebuilt/root/system/etc/apns-conf.xml:system/etc/apns-conf.xml

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

#CDMA Telephony Network
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=4

#EMMC Phone Storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.phone_storage = 0

#Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/marvelc/prebuilt/root/system/usr/keylayout/marvelc-keypad.kl:system/usr/keylayout/marvelc-keypad.kl \
    device/htc/marvelc/prebuilt/root/system/usr/keylayout/marvelc-keypad.kcm.bin:system/usr/keychars/marvelc-keypad.kcm.bin \
    device/htc/marvelc/prebuilt/root/system/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

#Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/marvelc/prebuilt/root/zImage
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

#Media Profiles
PRODUCT_COPY_FILES += \
    device/htc/marvel_common/prebuilt/root/system/etc/media_profiles.xml:system/etc/media_profiles.xml

#Marvelc libs
PRODUCT_PACKAGES += \
    gps.marvelc \
    lights.marvelc \
    sensors.marvelc \
    copybit.msm7k \
    gralloc.msm7k \
    libOmxCore \
    librs_jni

# Prebuilt Modules
PRODUCT_COPY_FILES += \
    device/htc/marvelc/prebuilt/root/system/lib/modules/bcm4329.ko:system/lib/modules/bcm4329.ko \
	device/htc/marvelc/prebuilt/root/system/lib/modules/hostap.ko:system/lib/modules/hostap.ko \
	device/htc/marvelc/prebuilt/root/system/lib/modules/lib80211.ko:system/lib/modules/lib80211.ko \
	device/htc/marvelc/prebuilt/root/system/lib/modules/lib80211_crypt_ccmp.ko:system/lib/modules/lib80211_crypt_ccmp.ko \
	device/htc/marvelc/prebuilt/root/system/lib/modules/lib80211_crypt_tkip.ko:system/lib/modules/lib80211_crypt_tkip.ko \
	device/htc/marvelc/prebuilt/root/system/lib/modules/lib80211_crypt_wep.ko:system/lib/modules/lib80211_crypt_wep.ko \
	device/htc/marvelc/prebuilt/root/system/lib/modules/michael_mic.ko:system/lib/modules/michael_mic.ko \
	device/htc/marvelc/prebuilt/root/system/lib/modules/ssb.ko:system/lib/modules/ssb.ko

#Ramdisk Files
PRODUCT_COPY_FILES += \
    device/htc/marvelc/ueventd.marvelc.rc:root/ueventd.marvelc.rc\
    device/htc/marvelc/init.marvelc.rc:root/init.marvelc.rc

#Fstab
PRODUCT_COPY_FILES += \
    device/htc/marvelc/prebuilt/root/system/etc/vold.fstab:system/etc/vold.fstab

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.hep = 1 \
    ro.ril.ecc.HTC-WWE=999 \
    ro.ril.ecc.HTC-ELL=92,93,94 \
    ro.ril.enable.a52.HTC-ITA=1 \
    ro.ril.enable.a53.HTC-ITA=1 \
    ro.ril.enable.a52=0 \
    ro.ril.enable.a53=1 \
    ro.ril.vmail.23415=1571,BT \
    ro.ril.hsdpa.category=8 \
    ro.ril.htcmaskw1.bitmask=4294967295 \
    ro.ril.htcmaskw1=14449 \
    ro.ril.def.agps.mode=2 \
    ro.ril.gprsclass=12 \
    ro.ril.disable.power.collapse=1 \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2 \
    ro.ril.disable.fd.plmn.prefix=23402,23410,23411 \
    ro.ril.update.acoustic.table = 1

#This is a 512MB device, so 32mb heapsize
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m

#Misc.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 \
    ro.workaround.noautofocus = 1 \
    keyguard.no_require_sim=true \
    settings.display.autobacklight=1 \
    ro.com.google.locationfeatures = 1 \
    ro.media.dec.aud.wma.enabled=1 \
    ro.media.dec.vid.wmv.enabled=1 \
    dalvik.vm.dexopt-flags=m=y \
    ro.config.sync=yes
	
#Device identifier (must come after all inclusions)
PRODUCT_DEVICE := htc_marvelc
PRODUCT_NAME := htc_marvelc
PRODUCT_BRAND := htc
PRODUCT_MODEL := HTC Wildfire S
PRODUCT_MANUFACTURER := htc