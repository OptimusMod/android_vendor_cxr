# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/cxr/prebuilt/common/bin/50-backup-script.sh:system/addon.d/50-backup-script.sh \
    vendor/cxr/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/cxr/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh

# CXR Sounds
PRODUCT_COPY_FILES += \
    vendor/cxr/prebuilt/common/media/audio/alarms/CXR-Alarm.ogg:system/media/audio/alarms/CXR-Alarm.ogg \
    vendor/cxr/prebuilt/common/media/audio/notifications/CXR-Notifications.ogg:system/media/audio/notifications/CXR-Notifications.ogg \
    vendor/cxr/prebuilt/common/media/audio/ringtones/CXR-Ringtone.ogg:system/media/audio/ringtones/CXR-Ringtone.ogg


# CXR Overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/cxr/overlay/common

# Disable ADB authentication and set root access to Apps and ADB
ifeq ($(DISABLE_ADB_AUTH),true)
    ADDITIONAL_DEFAULT_PROPERTIES += \
        ro.adb.secure=3 \
        persist.sys.root_access=3
endif

# Add and Remove
ifeq ($(PAC_USE_ADDREMOVE),true)
    GET_PROJECT_RMS := $(shell vendor/cxr/tools/removeprojects.py $(PRODUCT_NAME))
    GET_PROJECT_ADDS := $(shell vendor/cxr/tools/addprojects.py $(PRODUCT_NAME))
endif

# Chromium Prebuilt
ifeq ($(PRODUCT_PREBUILT_WEBVIEWCHROMIUM),yes)
-include prebuilts/chromium/$(TARGET_DEVICE)/chromium_prebuilt.mk
endif

# ROM Version

#Versioning

# Export rom name
export VENDOR := cxr

# Version info
ROM_VERSION_MAJOR := 4
ROM_VERSION_MINOR := 0.4
ROM_VERSION_MAINTENANCE := 
ROM_VERSION_TAG := BETA6

#CXR_BUILD

ifneq ($ROM_VERSION_TAG,"")
        VERSION := $(ROM_VERSION_MAJOR).$(ROM_VERSION_MINOR)$(ROM_VERSION_MAINTENANCE)-$(ROM_VERSION_TAG)
else
        VERSION := $(ROM_VERSION_MAJOR).$(ROM_VERSION_MINOR)$(ROM_VERSION_MAINTENANCE)
endif

export ROM_VERSION := $(VERSION)-$(shell date -u +%Y%m%d)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.modversion=$(ROM_VERSION) \
    ro.cxr.version=$(VERSION)
