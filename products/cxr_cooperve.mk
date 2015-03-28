# Check for target product
ifeq (cxr_cooperve,$(TARGET_PRODUCT))


# Inherit CM device configuration
$(call inherit-product, device/samsung/cooperve/cxr.mk)

PRODUCT_NAME := cxr_cooperve

endif
