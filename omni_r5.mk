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
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Get the prebuilt list of APNs
$(call inherit-product, vendor/omni/config/gsm.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/oppo/r5/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := omni_r5
PRODUCT_DEVICE := r5
PRODUCT_BRAND := OPPO
PRODUCT_MANUFACTURER := OPPO

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="OPPO/R8106/R5:4.4.4/KTU84P/1413614073:user/release-keys" \
    PRIVATE_BUILD_DESC="msm8916_32-user 4.4.4 KTU84P eng.root.20150422 release-keys"

# Inline kernel
TARGET_KERNEL_SOURCE := kernel/oppo/msm8916
TARGET_KERNEL_CONFIG := r5_defconfig

# Inherit from proprietary blobs
$(call inherit-product-if-exists, vendor/oppo/r5/r5-vendor.mk)

