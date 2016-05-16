#
# Copyright (C) 2016 The Android Open Source Project
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
#

TARGET_BOARD_PLATFORM := baytrail
POWERHAL_BYT := true

-include device/lenovo/spark/uefi.mk

ifneq ($(BUILD_KERNEL_FROM_SRC),true)
include device/lenovo/spark/prebuilts/kernel/prebuilt_kernel.mk
endif

#==============================================================================#
# Overlays
#==============================================================================#
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

#==============================================================================#
# Ramdisk ToDo : Sort this out. . .
#==============================================================================#
PRODUCT_PACKAGES += \
        init.rc \
        init.aosp.rc

PRODUCT_PACKAGES += \
        init.avc.rc \
        init.baylake.sh \
        init.common.rc \
        init.debug.rc \
        init.diag.rc \
        init.platform.gengfx.rc \
        init.platform.usb.rc \
        init.watchdog.rc \
        init.watchdog.sh \
        intel_prop.cfg \

PRODUCT_PACKAGES += \
        init.gps.rc \
        init.modem.rc \
        init.net.eth0.sh

PRODUCT_PACKAGES += \
        init.bt.rc \
        init.bt.vendor.rc \
        init.wifi.rc \
        init.wifi.vendor.rc \
        rfkill_bt.sh

PRODUCT_PACKAGES += \
        init.spark.rc \
        init.recovery.spark.rc \
        ueventd.spark.rc

PRODUCT_PACKAGES += \
        intel_prop \
        thermald \
        uefivar \
        uefivar_nolog

#==============================================================================#
# Device fstab
#==============================================================================#
PRODUCT_PACKAGES += \
        fstab \
        fstab.spark \
        fstab.charger.spark

PRODUCT_COPY_FILES += \
    device/lenovo/spark/recovery/twrp.fstab:recovery/root/etc/twrp.fstab

#==============================================================================#
# Hals
#==============================================================================#
PRODUCT_PACKAGES += lights.spark
PRODUCT_PACKAGES += power.spark

#==============================================================================#
# Audio
#==============================================================================#

#==============================================================================#
# Bluetooth
#==============================================================================#

#==============================================================================#
# GPS
#==============================================================================#

#==============================================================================#
# Key layout files
#==============================================================================#

#==============================================================================#
# Media
#==============================================================================#

#==============================================================================#
# Sensors
#==============================================================================#

#==============================================================================#
# Permissions
#==============================================================================#
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \

#==============================================================================#
# Wifi
#==============================================================================#
PRODUCT_PACKAGES += \
    libwpa_client \
    lib_driver_cmd_bcmdhd \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

#PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/system/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# WiFi Firmware
#$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)
