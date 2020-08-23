TARGET := iphone:clang:latest:13.0

include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = FNYTimesPlusPref

FNYTimesPlusPref_FILES = $(wildcard *.x *.m)
FNYTimesPlusPref_FRAMEWORKS = UIKit
FNYTimesPlusPref_PRIVATE_FRAMEWORKS = Preferences
FNYTimesPlusPref_INSTALL_PATH = /Library/PreferenceBundles
FNYTimesPlusPref_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/bundle.mk
