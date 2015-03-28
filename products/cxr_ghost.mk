# Check for target product
ifeq (cxr_ghost,$(TARGET_PRODUCT))


# Inherit CM device configuration
$(call inherit-product, device/motorola/ghost/cm.mk)

PRODUCT_NAME := cxr_ghost

endif
