# Check for target product
ifeq (cxr_pecan,$(TARGET_PRODUCT))


# Inherit CM device configuration
$(call inherit-product, device/lge/pecan/cm.mk)

PRODUCT_NAME := cxr_pecan

endif
