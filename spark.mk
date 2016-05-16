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

TARGET_KERNEL_ARCH := x86_64
TARGET_BOARD_PLATFORM := baytrail

#BUILD_KERNEL_FROM_SRC := true

# Inherit from those products. Most specific first.
$(call inherit-product, device/lenovo/spark/device.mk)
$(call inherit-product, device/intel/board/device-common.mk)

# Inherit the base android system
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Overrides
PRODUCT_NAME := spark
PRODUCT_DEVICE := spark
PRODUCT_BRAND := AOSP4IA
PRODUCT_MODEL := TAB S8-50F ROW
PRODUCT_MANUFACTURER := LENOVO

# languages
PRODUCT_LOCALES := en_US en_IN fr_FR it_IT es_ES et_EE de_DE nl_NL cs_CZ pl_PL ja_JP zh_TW zh_CN zh_HK ru_RU ko_KR nb_NO es_US da_DK el_GR tr_TR pt_PT pt_BR rm_CH sv_SE bg_BG ca_ES en_GB fi_FI hi_IN hr_HR hu_HU in_ID iw_IL lt_LT lv_LV ro_RO sk_SK sl_SI sr_RS uk_UA vi_VN tl_PH ar_EG fa_IR th_TH sw_TZ ms_MY af_ZA zu_ZA am_ET hi_IN en_XA ar_XB fr_CA km_KH lo_LA ne_NP mn_MN hy_AM az_AZ ka_GE de_AT de_CH de_LI en_AU en_CA en_NZ en_SG eo_EU fr_CH fr_BE it_CH nl_BE

# we do this little trick to fall back to other density if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal large xlarge ldpi mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Lenovo/S8-50F/S8-50F:5.0.1/BMAIN/S8-50F_S000456_151016_ROW:user/release-keys \
    PRIVATE_BUILD_DESC="spark_wifi_row-user 5.0.1 LRX22C eng.wangfan.20151016.173249 release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=320

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.build.delta=true \
    ro.build.mode=wifi_only \
    ro.build.region=row \
    ro.build.vibe=true \
    ro.build.project=spark_wifi_row \
    persist.service.apklogfs.enable=0 \
    ro.gnss.sv.status=true \
    persist.nomodem_ui=1 \
    persist.dual_sim=none

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=0 \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    ro.allow.mock.location=1 \
    persist.sys.usb.config=mtp

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)

PRODUCT_RUNTIMES := runtime_libart_default

# Use the non-open-source parts, if they're present
$(call inherit-product-if-exists, vendor/lenovo/spark/spark-vendor.mk)
