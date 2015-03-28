# Check for target product
ifeq (cxr_falcon,$(TARGET_PRODUCT))


# Inherit CM device configuration
$(call inherit-product, device/falcon/ghost/cm.mk)

PRODUCT_NAME := cxr_falcon

endif
