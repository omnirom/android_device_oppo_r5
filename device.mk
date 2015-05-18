# This file includes all definitions that apply to ALL r5 devices, and
# are also specific to r5 devices
#
# Everything in this directory will become public

DEVICE_PACKAGE_OVERLAYS := device/oppo/r5/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_CHARACTERISTICS := nosdcard

PRODUCT_PACKAGES += \
    charger_res_images

PRODUCT_PACKAGES += \
    com.android.future.usb.accessory

#Default USB mount
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        VisualizationWallpapers \
        librs_jni

# Ramdisk
PRODUCT_COPY_FILES += \
        device/oppo/r5/configs/init.qcom.rc:root/init.qcom.rc \
        device/oppo/r5/configs/init.target.rc:root/init.target.rc \
        device/oppo/r5/configs/init.oppo.usb.rc:root/init.oppo.usb.rc \
        device/oppo/r5/configs/init.qcom.usb.sh:root/init.qcom.usb.sh \
        device/oppo/r5/configs/init.qcom.sh:root/init.qcom.sh \
        device/oppo/r5/configs/ueventd.qcom.rc:root/ueventd.qcom.rc \
        device/oppo/r5/configs/fstab.qcom:root/fstab.qcom \
        device/oppo/r5/configs/twrp.fstab:recovery/root/etc/twrp.fstab \
        device/oppo/r5/configs/init.recovery.qcom.rc:root/init.recovery.qcom.rc
# Config files for touch and input
PRODUCT_COPY_FILES += \
	device/oppo/r5/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# Audio config files
PRODUCT_COPY_FILES += \
	device/oppo/r5/configs/audio_policy.conf:system/etc/audio_policy.conf \
	device/oppo/r5/configs/audio_effects.conf:system/etc/audio_effects.conf \
	device/oppo/r5/configs/mixer_paths.xml:/system/etc/mixer_paths.xml


# Media config files
PRODUCT_COPY_FILES += \
    device/oppo/r5/configs/media_codecs.xml:system/etc/media_codecs.xml \
    device/oppo/r5/configs/media_profiles.xml:system/etc/media_profiles.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# qcom init stuff
PRODUCT_COPY_FILES += \
	device/oppo/r5/configs/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
	device/oppo/r5/configs/init.qcom.uicc.sh:system/etc/init.qcom.uicc.sh \
	device/oppo/r5/configs/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh

# Wifi config
PRODUCT_COPY_FILES += \
	device/oppo/r5/configs/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
	device/oppo/r5/configs/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
        frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
        frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
        frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
        frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
        frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
        frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
        frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
        frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
        frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
        frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
        frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
        frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
        frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
        frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
        frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
        frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
        frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
        frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Hardware modules to build
PRODUCT_PACKAGES += \
    hwcomposer.msm8916 \
    gralloc.msm8916 \
    copybit.msm8916 \
    memtrack.msm8916 \
    audio.primary.msm8916 \
    audio_policy.msm8916 \
    lights.qcom \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    camera-wrapper.msm8916 \
    libaudio-resampler \
    audiod \
    libqcompostprocbundle \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    power.msm8916 \
    keystore.msm8916

PRODUCT_PACKAGES += \
    libmm-omxcore \
    libdivxdrmdecrypt \
    libOmxVdec \
    libOmxVenc \
    libOmxCore \
    libstagefrighthw \
    libc2dcolorconvert

#    libOmxAacEnc \
#    libOmxAmrEnc \
#    libOmxEvrcEnc \
#    libOmxQcelp13Enc \


# wifi
PRODUCT_PACKAGES += \
    mac-update \
    wcnss_service \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf \
    dhcpcd.conf

PRODUCT_COPY_FILES += \
	device/oppo/r5/configs/init.qcom.bt.sh:system/etc/init.qcom.bt.sh

# NFC packages
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    Tag

# NFC feature files
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# GPS configuration
PRODUCT_COPY_FILES += \
	device/oppo/r5/configs/gps.conf:system/etc/gps.conf

# Properties

# bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
	ro.qualcomm.bt.hci_transport=smd

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072 \
    ro.sf.lcd_density=480 \
	persist.hwc.mdpcomp.enable=true

# Do not power down SIM card when modem is sent to Low Power Mode.
PRODUCT_PROPERTY_OVERRIDES += \
	persist.radio.apm_sim_not_pwdn=1 \
	persist.radio.eons.enabled=false \
	persist.radio.custom_exp_ecc=1

# Ril sends only one RIL_UNSOL_CALL_RING, so set call_ring.multiple to false
PRODUCT_PROPERTY_OVERRIDES += \
	ro.telephony.call_ring.multiple=false

# Ril
PRODUCT_PROPERTY_OVERRIDES += \
	rild.libpath=/system/lib/libril-qc-qmi-1.so

# Cell Broadcasts
PRODUCT_PROPERTY_OVERRIDES += \
	ro.cellbroadcast.emergencyids=0-65534 

PRODUCT_PROPERTY_OVERRIDES += \
	telephony.lteOnCdmaDevice=0

PRODUCT_PROPERTY_OVERRIDES += \
	drm.service.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15

# Enable AAC 5.1 output
PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
    debug.egl.recordable.rgba8888=1

# qcom
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.ssr=false \
    ro.qc.sdk.sensors.gestures=true \
    ro.qc.sdk.camera.facialproc=false \
    ro.qc.sdk.gestures.camera=false \
    camera2.portability.force_api=1

# Audio Configuration
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sdk.audio.fluencetype=fluence \
    persist.audio.fluence.voicecall=true \
    af.resampler.quality=4 \
    audio.offload.buffer.size.kb=32 \
    audio.offload.gapless.enabled=true \
    use.voice.path.for.pcm.voip=true \
    av.offload.enable=false \
    av.streaming.offload.enable=false \
    audio.offload.pcm.16bit.enable=true \
    audio.offload.multiple.enabled=false


# QCOM
PRODUCT_PROPERTY_OVERRIDES += \
    com.qc.hardware=true

# QC Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=/system/lib/libqc-opt.so

# gps
#system prop for switching gps driver to qmi
PRODUCT_PROPERTY_OVERRIDES += \
    persist.gps.qmienabled=true

#$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
#$(call inherit-product, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

