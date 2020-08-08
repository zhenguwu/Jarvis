export TARGET = iphone:clang:13.5:13.0
export ARCHS = arm64 arm64e

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = Jarvis

Jarvis_FILES = JRVRootListController.m
Jarvis_INSTALL_PATH = /Library/PreferenceBundles
Jarvis_FRAMEWORKS = UIKit
Jarvis_PRIVATE_FRAMEWORKS = Preferences
Jarvis_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/Jarvis.plist$(ECHO_END)
