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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

USE_CAMERA_STUB := false
BOARD_USE_FROYO_LIBCAMERA := true

# inherit from the proprietary version
-include vendor/htc/marvelc/BoardConfigVendor.mk

#Audio
BOARD_USES_GENERIC_AUDIO := false

#Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

#Camera
BOARD_USE_NASTY_PTHREAD_CREATE_HACK := true

#FM Radio
BOARD_HAVE_FM_RADIO := true
BOARD_GLOBAL_CFLAGS += -DHAVE_FM_RADIO

#GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := marvelc
BOARD_USES_QCOM_GPS := true
BOARD_VENDOR_QCOM_GPS_LOC_API_AMSS_VERSION := 20000
BOARD_USES_QCOM_LIBRPC := true
BOARD_VENDOR_QCOM_AMSS_VERSION := 4735
BOARD_VENDOR_USE_AKMD := akm8975

#Graphics
TARGET_LIBAGL_USE_GRALLOC_COPYBITS := true
BOARD_EGL_CFG := device/htc/marvelc/prebuilt/egl.cfg
BOARD_NO_RGBX_8888 := true

#JS Engine
JS_ENGINE:=v8

#Kernel
TARGET_PREBUILT_KERNEL := device/htc/marvelc/prebuilt/root/zImage
BOARD_KERNEL_BASE := 0x12c00000
BOARD_KERNEL_CMDLINE := no_console_suspend=1 console=null
BOARD_KERNEL_PAGESIZE := 2048

#Misc
TARGET_RELEASETOOLS_EXTENSIONS := device/htc/common
TARGET_BOOTLOADER_BOARD_NAME := marvelc

#No Bootloader or Radio Image
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

#No Select Button
BOARD_HAS_NO_SELECT_BUTTON := true

#Partitions
# cat /proc/mtd
#dev:    size   erasesize  name
#mtd0: 00100000 00040000 "misc"
#mtd1: 00500000 00040000 "recovery"
#mtd2: 00340000 00040000 "boot"
#mtd3: 10400000 00040000 "system"
#mtd4: 02300000 00040000 "cache"
#mtd5: 09600000 00040000 "userdata"
#mtd6: 00a00000 00040000 "devlog"
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x00340000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x00500000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x10400000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x09600000
BOARD_FLASH_BLOCK_SIZE := 262144

#Processor Information
TARGET_ARCH_VARIANT := armv6-vfp
TARGET_BOARD_PLATFORM := msm7k
TARGET_BOARD_PLATFORM_GPU := qcom-adreno200
TARGET_CPU_ABI := armeabi-v6l
TARGET_CPU_ABI2 := armeabi

#QCOM Specifics
BOARD_USES_QCOM_HARDWARE := true
BOARD_USES_QCOM_LIBS := true

#RIL
BOARD_USE_NEW_LIBRIL_HTC := true

#WiFi Information
BOARD_WPA_SUPPLICANT_DRIVER := WEXT
WPA_SUPPLICANT_VERSION      := VER_0_6_X
BOARD_WLAN_DEVICE           := bcm4329
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/firmware/fw_bcm4329.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/firmware/fw_bcm4329_apsta.bin"
WIFI_DRIVER_MODULE_ARG      := "firmware_path=/system/etc/firmware/fw_bcm4329.bin nvram_path=/proc/calibration"
WIFI_DRIVER_MODULE_NAME     := "bcm4329"

#Custom Graphics
BOARD_CUSTOM_GRAPHICS := ../../../device/htc/marvelc/recovery/graphics.c