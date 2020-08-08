export TARGET = iphone:clang:13.5:13.0
export ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Jarvis

Jarvis_FILES = Tweak.xm
Jarvis_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += jarvispreferences
include $(THEOS_MAKE_PATH)/aggregate.mk
