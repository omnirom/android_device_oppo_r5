ifneq ($(filter r5,$(TARGET_DEVICE)),)
    include $(all-subdir-makefiles)
endif
