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

#Call the common folder
$(call inherit-product, device/htc/marvel_common/marvel_common.mk)

# Call the vendor folder
$(call inherit-product-if-exists, vendor/htc/marvelc/marvelc-vendor.mk)

#CDMA APN's not in vendor
PRODUCT_COPY_FILES += \
    device/htc/marvelc/prebuilt/root/system/etc/apns-conf.xml:system/etc/apns-conf.xml

# CDMA Permissions
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

#Device identifier (must come after all inclusions)
PRODUCT_DEVICE := marvelc
PRODUCT_NAME := htc_marvelc
PRODUCT_BRAND := HTC
PRODUCT_MODEL := HTC Wildfire S
PRODUCT_MANUFACTURER := HTC

#Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/marvelc/key/marvelc-keypad.kl:system/usr/keylayout/marvelc-keypad.kl \
    device/htc/marvelc/key/marvelc-keypad.kcm.bin:system/usr/keychars/marvelc-keypad.kcm.bin \
    device/htc/marvelc/key/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl

#Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/marvelc/prebuilt/root/zImage
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

#Marvelc libs
PRODUCT_PACKAGES += \
    gps.marvelc \
    lights.marvelc \
    sensors.marvelc

# Prebuilt Modules
PRODUCT_COPY_FILES += \
    device/htc/marvelc/prebuilt/bcm4329.ko:system/lib/modules/bcm4329.ko

#Ramdisk Files
PRODUCT_COPY_FILES += \
    device/htc/marvelc/ueventd.marvelc.rc:root/ueventd.marvelc.rc\
    device/htc/marvelc/init.marvelc.rc:root/init.marvelc.rc

# RIL
PRODUCT_PROPERTY_OVERRIDES += \
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
    ro.telephony.default_network=4 \
    ro.ril.disable.fd.plmn.prefix=23402,23410,23411 \
    ro.ril.update.acoustic.table = 1
