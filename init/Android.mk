ifeq ($(TARGET_INIT_VENDOR_LIB),libinit_r5)

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE_TAGS := optional
LOCAL_C_INCLUDES := system/core/init
LOCAL_CFLAGS := -Wall -DANDROID_TARGET=\"$(TARGET_BOARD_PLATFORM)\"
LOCAL_SRC_FILES := init_r5.c

LOCAL_MODULE := libinit_r5
include $(BUILD_STATIC_LIBRARY)

#LOCAL_STATIC_LIBRARIES := \
#        libcutils \
#        liblog

#LOCAL_MODULE := init_r5
#include $(BUILD_EXECUTABLE)

endif
