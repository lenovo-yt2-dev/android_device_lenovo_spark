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

# force insecure boot.img
ADDITIONAL_DEFAULT_PROPERTIES += \
        ro.secure=0 \
        ro.adb.secure=0 \
        ro.debuggable=1 \
        ro.allow.mock.location=1

include device/intel/board/BoardConfigCommon.mk

TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RECOVERY := false

BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_CMDLINE := init=/init pci=noearly
BOARD_KERNEL_CMDLINE += loglevel=5 androidboot.bootmedia=sdcard
BOARD_KERNEL_CMDLINE += androidboot.hardware=spark watchdog.watchdog_thresh=60
BOARD_KERNEL_CMDLINE += androidboot.spid=xxxx:xxxx:xxxx:xxxx:xxxx:xxxx
BOARD_KERNEL_CMDLINE += androidboot.serialno=01234567890123456789
BOARD_KERNEL_CMDLINE += oops=panic panic=40 vmalloc=172M debug_locks=0 bootboost=1
BOARD_KERNEL_CMDLINE += vga=current i915.modeset=1 drm.vblankoffdelay=1 acpi_backlight=vendor
BOARD_KERNEL_CMDLINE += i915.mipi_panel_id=3
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive

BOARD_KERNEL_BASE := 0x10008000
BOARD_KERNEL_PAGESIZE := 2048

ifeq ($(BUILD_KERNEL_FROM_SRC),true)
TARGET_KERNEL_SOURCE := linux/kernel
TARGET_KERNEL_CONFIG := cyanogenmod_spark_defconfig
TARGET_KERNEL_MODULES_IN_ROOT := true
endif

# Specify location of board-specific kernel headers
TARGET_BOARD_KERNEL_HEADERS := device/lenovo/spark/kernel-headers

#adb fix
BOARD_FUNCTIONFS_HAS_SS_COUNT := true

# Init
TARGET_PROVIDES_INIT_TARGET_RC := true

# Filesystem
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := false

BOARD_FLASH_BLOCK_SIZE := 512

BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648

# Storage information
BOARD_HAS_LARGE_FILESYSTEM := true

# Reduce space taken by the journal
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0

RECOVERY_HAVE_SD_CARD := true

# By default recovery minui expects RGBA framebuffer :
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_FSTAB := device/lenovo/spark/recovery/recovery.fstab
BOARD_UMS_LUNFILE := "/sys/class/android_usb/f_mass_storage/lun/file"

RECOVERY_VARIANT := twrp
ifeq ($(RECOVERY_VARIANT),twrp)
include device/lenovo/spark/recovery/twrp.mk
endif

# Bluetooth :
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/lenovo/spark/bluetooth

# Add some intel BOOTCLASSPATH
#PRODUCT_BOOT_JARS += com.broadcom.bt

# GPS
BOARD_HAVE_GPS := true

# Define platform battery healthd library

# WiFi :
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER        := NL80211
CONFIG_HS20                 := true
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/firmware/fw_bcmdhd.bin"

# SELinux :

# Use the non-open-source parts, if they're present :
-include vendor/lenovo/spark/BoardConfigVendor.mk
