LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)


LOCAL_MODULE := LED_Library
LOCAL_SRC_FILES := LED_Library.cpp
include $(BUILD_SHARED_LIBRARY)