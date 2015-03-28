# Check for target product
ifeq (cxr_cooper,$(TARGET_PRODUCT))


# Inherit CM device configuration
$(call inherit-product, device/samsung/cooper/cm.mk)

PRODUCT_NAME := cxr_cooper

endif
