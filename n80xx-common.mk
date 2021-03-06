#
# Copyright (C) 2012 The CyanogenMod Project
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

DEVICE_PACKAGE_OVERLAYS += device/samsung/n80xx-common/overlay-common

PRODUCT_AAPT_CONFIG := xlarge
PRODUCT_AAPT_PREF_CONFIG := mdpi

TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 1280

# Init files
PRODUCT_COPY_FILES += \
    device/samsung/n80xx-common/ueventd.smdk4x12.rc:root/ueventd.smdk4x12.rc \
    device/samsung/n80xx-common/ueventd.smdk4x12.rc:recovery/root/ueventd.smdk4x12.rc \
    device/samsung/n80xx-common/fstab.smdk4x12:root/fstab.smdk4x12

# Recovery
TARGET_RECOVERY_FSTAB := device/samsung/n80xx-common/fstab.smdk4x12
RECOVERY_FSTAB_VERSION := 2

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/n80xx-common/configs/audio_policy.conf:system/etc/audio_policy.conf \
    device/samsung/n80xx-common/configs/tiny_hw.xml:system/etc/sound/n80xx
        
# Camera
PRODUCT_COPY_FILES += \
    device/samsung/n80xx-common/configs/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1
    
# ART
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-flags=--no-watch-dog

# USB-OTG
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.isUsbOtgEnabled=true

# I/O Scheduler
PRODUCT_PROPERTY_OVERRIDES += \
    sys.io.scheduler=cfq

# Packages
PRODUCT_PACKAGES += \
    camera.smdk4x12 \
    libhwjpeg \
    libsecril-client
    
# IR packages
PRODUCT_PACKAGES += \
    consumerir.exynos4

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.consumerir.xml:system/etc/permissions/android.hardware.consumerir.xml    

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml

# Set product characteristic to tablet, needed for some ui elements
PRODUCT_CHARACTERISTICS := tablet

$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product, device/samsung/smdk4412-common/common.mk)

$(call inherit-product-if-exists, vendor/samsung/n80xx/n80xx-vendor.mk)
