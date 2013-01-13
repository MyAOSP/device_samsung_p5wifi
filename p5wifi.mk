# Copyright (C) 2011 The Android Open Source Project
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

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/modules/dhd.ko:system/lib/modules/dhd.ko \
    $(LOCAL_PATH)/modules/cifs.ko:system/lib/modules/cifs.ko \
    $(LOCAL_PATH)/modules/ntfs.ko:system/lib/modules/ntfs.ko

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# LPM (charging animation)
# this has to be defined before calling p4-common.mk
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/lpm/media/battery_charging_0.qmg:system/media/battery_charging_0.qmg \
     $(LOCAL_PATH)/lpm/media/battery_charging_20.qmg:system/media/battery_charging_20.qmg \
     $(LOCAL_PATH)/lpm/media/battery_charging_40.qmg:system/media/battery_charging_40.qmg \
     $(LOCAL_PATH)/lpm/media/battery_charging_60.qmg:system/media/battery_charging_60.qmg \
     $(LOCAL_PATH)/lpm/media/battery_charging_80.qmg:system/media/battery_charging_80.qmg \
     $(LOCAL_PATH)/lpm/media/battery_charging_100.qmg:system/media/battery_charging_100.qmg \
     $(LOCAL_PATH)/lpm/media/battery_error.qmg:system/media/battery_error.qmg \
     $(LOCAL_PATH)/lpm/media/chargingwarning.qmg:system/media/chargingwarning.qmg \
     $(LOCAL_PATH)/lpm/media/Disconnected.qmg:system/media/Disconnected.qmg

$(call inherit-product, device/samsung/p4-common/p4-common.mk)

$(call inherit-product-if-exists, vendor/samsung/p5wifi/p5wifi-vendor.mk)

# Cameradata
PRODUCT_COPY_FILES += \
    device/samsung/p4-common/camera/cameradata/back_camera_test_pattern.yuv:system/cameradata/back_camera_test_pattern.yuv \
    device/samsung/p4-common/camera/cameradata/datapattern_420sp.yuv:system/cameradata/datapattern_420sp.yuv \
    device/samsung/p4-common/camera/cameradata/datapattern_front_420sp.yuv:system/cameradata/datapattern_front_420sp.yuv \
    device/samsung/p4-common/camera/cameradata/front_camera_test_pattern.yuv:system/cameradata/front_camera_test_pattern.yuv

# Hdmi
PRODUCT_COPY_FILES += \
    device/samsung/p4-common/hdmi/dectable1.dat:system/etc/hdmi/dectable1.dat \
    device/samsung/p4-common/hdmi/dectable.dat:system/etc/hdmi/dectable.dat

DEVICE_PACKAGE_OVERLAYS += \
    $(LOCAL_PATH)/overlay

PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/gps.xml:system/etc/gps.xml

# GPS config
PRODUCT_PROPERTY_OVERRIDES += \
  my.gps=novzw

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := p5wifi
PRODUCT_DEVICE := p5wifi
PRODUCT_MODEL := p5wifi
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
