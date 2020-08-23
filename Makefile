TARGET := iphone:clang:latest:13.0
INSTALL_TARGET_PROCESSES = SpringBoard

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = FNYTimesPlus

FNYTimesPlus_FILES = $(wildcard *.x *.m)
FNYTimesPlus_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += fnytimespluspref
include $(THEOS_MAKE_PATH)/aggregate.mk