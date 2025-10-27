#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# API levels
PRODUCT_SHIPPING_API_LEVEL := 30

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd
    
# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-impl.recovery \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := tablet

# Rootdir
PRODUCT_PACKAGES += \
    log_to_csv.sh \
    loading.sh \
    para.sh \
    total.sh \
    install-recovery.sh \

PRODUCT_PACKAGES += \
    fstab.enableswap \
    init.cali.rc \
    init.factorytest.rc \
    init.gta8wifi.rc \
    init.storage.rc \
    init.ums512_25c10.rc \
    init.ums512_25c10.usb.rc \
    init.recovery.common.rc \
    init.recovery.samsung.rc \
    init.recovery.ums512_25c10.rc \
    ueventd.ums512_25c10.rc \
    
# Exclude 32 bit libraries
PRODUCT_PACKAGES_EXCLUDE_32BIT += \
    vendor.samsung.hardware.biometrics.face@3.0 \
    vendor.sprd.hardware.log-V1-ndk \
    vendor.unisoc.hardware.power-V1-ndk

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.enableswap:$(TARGET_COPY_OUT_RAMDISK)/fstab.enableswap

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Compatibility matrix
DEVICE_COMPATIBILITY_MATRIX_FILE := \
    $(LOCAL_PATH)/compatibility_matrix.device.xml

# Inherit the proprietary files
$(call inherit-product, vendor/samsung/gta8wifi/gta8wifi-vendor.mk)
