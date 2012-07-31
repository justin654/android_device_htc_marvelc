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
-include vendor/htc/marvel/BoardConfigVendor.mk

# inherit from the common folder
-include device/htc/marvel_common/BoardConfigCommon.mk

BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := marvelc
TARGET_BOOTLOADER_BOARD_NAME := marvelc
TARGET_PREBUILT_KERNEL := device/htc/marvelc/prebuilt/kernel
BOARD_CUSTOM_GRAPHICS := ../../../device/htc/marvel_common/recovery/graphics.c
