#!/bin/sh

# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#--------------------------------------------------------------

DEVICE=kai
MANUFACTURER=lenovo
OUTVENDOR=vendor
#--------------------------------------------------------------

#--------------------------------------------------------------
# KAI
#--------------------------------------------------------------

OUTDIR=$OUTVENDOR/$MANUFACTURER/$DEVICE
MAKEFILE=../../../$OUTDIR/device-vendor.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_STEM := kai/device-partial.mk

\$(call inherit-product-if-exists, vendor/asus/\$(LOCAL_STEM))
\$(call inherit-product-if-exists, vendor/broadcom/\$(LOCAL_STEM))
\$(call inherit-product-if-exists, vendor/elan/\$(LOCAL_STEM))
\$(call inherit-product-if-exists, vendor/invensense/\$(LOCAL_STEM))
\$(call inherit-product-if-exists, vendor/lenovo/\$(LOCAL_STEM))
\$(call inherit-product-if-exists, vendor/nvidia/\$(LOCAL_STEM))
\$(call inherit-product-if-exists, vendor/nxp/\$(LOCAL_STEM))
\$(call inherit-product-if-exists, vendor/trusted_logic/\$(LOCAL_STEM))
\$(call inherit-product-if-exists, vendor/widevine/\$(LOCAL_STEM))

\$(call inherit-product-if-exists, vendor/unknown/\$(LOCAL_STEM))

PRODUCT_RESTRICT_VENDOR_FILES := owner
EOF

MAKEFILE=../../../$OUTDIR/BoardConfigVendor.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_STEM := kai/BoardConfigPartial.mk

-include vendor/asus/\$(LOCAL_STEM)
-include vendor/broadcom/\$(LOCAL_STEM)
-include vendor/elan/\$(LOCAL_STEM)
-include vendor/invensense/\$(LOCAL_STEM)
-include vendor/nvidia/\$(LOCAL_STEM)
-include vendor/nxp/\$(LOCAL_STEM)
-include vendor/trusted_logic/\$(LOCAL_STEM)
-include vendor/widevine/\$(LOCAL_STEM)

-include vendor/unknown/\$(LOCAL_STEM)
EOF


#--------------------------------------------------------------


MAKEFILE=../../../$OUTDIR/device-partial.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# KAI blob(s) necessary for Lenovo hardware
PRODUCT_PACKAGES := \\
    asound \\
    camera.tegra \\
    libdrmwvmplugin \\
    lights.kai \\
    libwvm \\
    sensors.kai \\
    tf_daemon
EOF


#--------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/proprietary/Android.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),kai)

include \$(CLEAR_VARS)
LOCAL_MODULE := asound
LOCAL_MODULE_OWNER := nvidia
LOCAL_SRC_FILES := asound.conf
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .conf
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := \$(TARGET_OUT)/etc
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := camera.tegra
LOCAL_MODULE_OWNER := nvidia
LOCAL_SRC_FILES := camera.tegra.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib/hw
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libdrmwvmplugin   
LOCAL_MODULE_OWNER := widevine
LOCAL_SRC_FILES := libdrmwvmplugin.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib/drm
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := lights.kai   
LOCAL_MODULE_OWNER := lenovo
LOCAL_SRC_FILES := lights.kai.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib/hw
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libwvm   
LOCAL_MODULE_OWNER := widevine
LOCAL_SRC_FILES := libwvm.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := sensors.kai   
LOCAL_MODULE_OWNER := lenovo
LOCAL_SRC_FILES := sensors.kai.so
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib/hw
include \$(BUILD_PREBUILT)

#include \$(CLEAR_VARS)
#LOCAL_MODULE := sensors-config   
#LOCAL_MODULE_OWNER := nvidia
#LOCAL_SRC_FILES := sensors-config
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE_CLASS := EXECUTABLES
#LOCAL_MODULE_PATH := \$(TARGET_OUT)/bin
#include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := tf_daemon   
LOCAL_MODULE_OWNER := nvidia
LOCAL_SRC_FILES := tf_daemon
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/bin
include \$(BUILD_PREBUILT)

endif
EOF

#--------------------------------------------------------------
#  BROADCOM
#--------------------------------------------------------------

OUTDIR=$OUTVENDOR/broadcom/$DEVICE
mkdir -p ../../../$OUTDIR/proprietary
MAKEFILE=../../../$OUTDIR/proprietary/Android.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),kai)

include \$(CLEAR_VARS)
LOCAL_MODULE := glgps
LOCAL_SRC_FILES := glgps
LOCAL_MODULE_CLASS := EXECUTABLES
LOCAL_MODULE_PATH := \$(TARGET_OUT_EXECUTABLES)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := broadcom
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := bcm4330
LOCAL_SRC_FILES := bcm4330.hcd
LOCAL_MODULE_SUFFIX := .hcd
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := \$(TARGET_OUT_ETC)/firmware
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := broadcom
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := gpsconfig
LOCAL_SRC_FILES := gpsconfig.xml
LOCAL_MODULE_SUFFIX := .xml
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := \$(TARGET_OUT_ETC)/gps
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := broadcom
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := gps.tegra
LOCAL_SRC_FILES := gps.tegra.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := broadcom
include \$(BUILD_PREBUILT)

endif
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/device-partial.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Broadcom blob(s) necessary for kai hardware
PRODUCT_PACKAGES := \\
    glgps \\
    gps.tegra \\
    gpsconfig \\
    bcm4330
EOF

MAKEFILE=../../../$OUTDIR/BoardConfigPartial.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
EOF


#--------------------------------------------------------------
#  NVIDIA
#--------------------------------------------------------------

OUTDIR=$OUTVENDOR/nvidia/$DEVICE
mkdir -p ../../../$OUTDIR/proprietary
MAKEFILE=../../../$OUTDIR/proprietary/Android.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),kai)

include \$(CLEAR_VARS)
LOCAL_MODULE := gralloc.tegra
LOCAL_SRC_FILES := gralloc.tegra.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib/hw
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := hwcomposer.tegra
LOCAL_SRC_FILES := hwcomposer.tegra.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib/hw
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libardrv_dynamic
LOCAL_SRC_FILES := libardrv_dynamic.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libcgdrv
LOCAL_SRC_FILES := libcgdrv.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libEGL_tegra
LOCAL_SRC_FILES := libEGL_tegra.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib/egl
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libGLESv1_CM_tegra
LOCAL_SRC_FILES := libGLESv1_CM_tegra.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib/egl
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libGLESv2_tegra
LOCAL_SRC_FILES := libGLESv2_tegra.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib/egl
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvapputil
LOCAL_SRC_FILES := libnvapputil.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvasfparserhal
LOCAL_SRC_FILES := libnvasfparserhal.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvaviparserhal
LOCAL_SRC_FILES := libnvaviparserhal.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvavp
LOCAL_SRC_FILES := libnvavp.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvcamerahdr
LOCAL_SRC_FILES := libnvcamerahdr.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvddk_2d
LOCAL_SRC_FILES := libnvddk_2d.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvddk_2d_v2
LOCAL_SRC_FILES := libnvddk_2d_v2.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

#include \$(CLEAR_VARS)
#LOCAL_MODULE := libnvdispmgr_d
#LOCAL_SRC_FILES := libnvdispmgr_d.so
#LOCAL_MODULE_SUFFIX := .so
#LOCAL_MODULE_CLASS := SHARED_LIBRARIES
#LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE_OWNER := nvidia
#include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmm
LOCAL_SRC_FILES := libnvmm.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmmlite
LOCAL_SRC_FILES := libnvmmlite.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmmlite_audio
LOCAL_SRC_FILES := libnvmmlite_audio.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmmlite_image
LOCAL_SRC_FILES := libnvmmlite_image.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmmlite_utils
LOCAL_SRC_FILES := libnvmmlite_utils.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmmlite_video
LOCAL_SRC_FILES := libnvmmlite_video.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmm_audio
LOCAL_SRC_FILES := libnvmm_audio.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmm_camera
LOCAL_SRC_FILES := libnvmm_camera.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmm_contentpipe
LOCAL_SRC_FILES := libnvmm_contentpipe.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmm_image
LOCAL_SRC_FILES := libnvmm_image.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmm_manager
LOCAL_SRC_FILES := libnvmm_manager.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmm_misc
LOCAL_SRC_FILES := libnvmm_misc.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmm_parser
LOCAL_SRC_FILES := libnvmm_parser.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmm_service
LOCAL_SRC_FILES := libnvmm_service.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmm_utils
LOCAL_SRC_FILES := libnvmm_utils.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmm_video
LOCAL_SRC_FILES := libnvmm_video.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvmm_writer
LOCAL_SRC_FILES := libnvmm_writer.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvodm_dtvtuner
LOCAL_SRC_FILES := libnvodm_dtvtuner.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvodm_hdmi
LOCAL_SRC_FILES := libnvodm_hdmi.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvodm_imager
LOCAL_SRC_FILES := libnvodm_imager.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvodm_misc
LOCAL_SRC_FILES := libnvodm_misc.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvodm_query
LOCAL_SRC_FILES := libnvodm_query.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvomx
LOCAL_SRC_FILES := libnvomx.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvomxilclient
LOCAL_SRC_FILES := libnvomxilclient.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvos
LOCAL_SRC_FILES := libnvos.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvparser
LOCAL_SRC_FILES := libnvparser.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvrm
LOCAL_SRC_FILES := libnvrm.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvrm_graphics
LOCAL_SRC_FILES := libnvrm_graphics.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvsm
LOCAL_SRC_FILES := libnvsm.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvtvmr
LOCAL_SRC_FILES := libnvtvmr.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvwinsys
LOCAL_SRC_FILES := libnvwinsys.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libnvwsi
LOCAL_SRC_FILES := libnvwsi.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libstagefrighthw
LOCAL_SRC_FILES := libstagefrighthw.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libtf_crypto_sst
LOCAL_SRC_FILES := libtf_crypto_sst.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := nvavp_os_00001000
LOCAL_SRC_FILES := nvavp_os_00001000.bin
LOCAL_MODULE_SUFFIX := .bin
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := \$(TARGET_OUT)/etc/firmware
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := nvavp_os_0ff00000
LOCAL_SRC_FILES := nvavp_os_0ff00000.bin
LOCAL_MODULE_SUFFIX := .bin
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := \$(TARGET_OUT)/etc/firmware
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := nvavp_os_e0000000
LOCAL_SRC_FILES := nvavp_os_e0000000.bin
LOCAL_MODULE_SUFFIX := .bin
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := \$(TARGET_OUT)/etc/firmware
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := nvavp_os_eff00000
LOCAL_SRC_FILES := nvavp_os_eff00000.bin
LOCAL_MODULE_SUFFIX := .bin
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := \$(TARGET_OUT)/etc/firmware
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := nvavp_vid_ucode_alt
LOCAL_SRC_FILES := nvavp_vid_ucode_alt.bin
LOCAL_MODULE_SUFFIX := .bin
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := \$(TARGET_OUT)/etc/firmware
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := nvcamera
LOCAL_SRC_FILES := nvcamera.conf
LOCAL_MODULE_SUFFIX := .conf
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := \$(TARGET_OUT)/etc
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := nvram_4330
LOCAL_SRC_FILES := nvram_4330.txt
LOCAL_MODULE_SUFFIX := .txt
LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := \$(TARGET_OUT_ETC)
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := nvidia
include \$(BUILD_PREBUILT)

endif
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/device-partial.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# NVIDIA blob(s) necessary for kai hardware
PRODUCT_PACKAGES := \\
    
    nvavp_os_0ff00000 \\
    nvavp_vid_ucode \\
    nvavp_os_eff00000 \\
    nvavp_vid_ucode_alt \\
    nvcamera \\
    nvram_4330 \\
    libEGL_tegra \\
    libGLESv1_CM_tegra \\
    libGLESv2_tegra \\
    gralloc.tegra \\
    hwcomposer.tegra \\
    libardrv_dynamic \\
    libcgdrv \\
    libnvapputil \\
    libnvasfparserhal \\
    libnvaviparserhal \\
    libnvavp \\
    libnvcamerahdr \\
    libnvddk_2d_v2 \\
    libnvddk_2d \\
    libnvmm_audio \\
    libnvmm_camera \\
    libnvmm_contentpipe \\
    libnvmm_image \\
    libnvmm_manager \\
    libnvmm_misc \\
    libnvmm_parser \\
    libnvmm_service \\
    libnvmm_utils \\
    libnvmm_video \\
    libnvmm_writer \\
    libnvmm \\
    libnvmmlite \\
    libnvmmlite_audio \\
    libnvmmlite_image \\
    libnvmmlite_utils \\
    libnvmmlite_video \\
    libnvodm_dtvtuner \\
    libnvodm_hdmi \\
    libnvodm_imager \\
    libnvodm_misc \\
    libnvodm_query \\
    libnvomx \\
    libnvomxilclient \\
    libnvos \\
    libnvparser \\
    libnvrm_graphics \\
    libnvrm \\
    libnvsm \\
    libnvtvmr \\
    libnvwinsys \\
    libnvwsi \\
    libstagefrighthw \\
    libtf_crypto_sst
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/BoardConfigPartial.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
EOF



#--------------------------------------------------------------
#  WIDEVINE
#--------------------------------------------------------------

OUTDIR=$OUTVENDOR/widevine/$DEVICE
mkdir -p ../../../$OUTDIR/proprietary
MAKEFILE=../../../$OUTDIR/proprietary/Android.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),kai)

include \$(CLEAR_VARS)
LOCAL_MODULE := libdrmdecrypt
LOCAL_SRC_FILES := libdrmdecrypt.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := widevine
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libwvdrm_L1
LOCAL_SRC_FILES := libwvdrm_L1.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := widevine
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libWVStreamControlAPI_L1
LOCAL_SRC_FILES := libWVStreamControlAPI_L1.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := widevine
include \$(BUILD_PREBUILT)

endif
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/device-partial.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Widevine blob(s) necessary for kai hardware
PRODUCT_PACKAGES := \\
    libdrmdecrypt \\
    libwvdrm_L1 \\
    libWVStreamControlAPI_L1
EOF

MAKEFILE=../../../$OUTDIR/BoardConfigPartial.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
EOF


#--------------------------------------------------------------
#  INVENSENSE
#--------------------------------------------------------------

OUTDIR=$OUTVENDOR/invensense/$DEVICE
mkdir -p ../../../$OUTDIR/proprietary
MAKEFILE=../../../$OUTDIR/proprietary/Android.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),kai)

include \$(CLEAR_VARS)
LOCAL_MODULE := libinvensense_hal
LOCAL_SRC_FILES := libinvensense_hal.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := invensense
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libmllite
LOCAL_SRC_FILES := libmllite.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := invensense
include \$(BUILD_PREBUILT)

include \$(CLEAR_VARS)
LOCAL_MODULE := libmplmpu
LOCAL_SRC_FILES := libmplmpu.so
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_PATH := \$(TARGET_OUT)/lib
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_OWNER := invensense
include \$(BUILD_PREBUILT)

endif
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/device-partial.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Invensense blob(s) necessary for kai hardware
PRODUCT_PACKAGES := \\
    libinvensense_hal \\
    libmllite \\
    libmplmpu
EOF

MAKEFILE=../../../$OUTDIR/BoardConfigPartial.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
EOF

#--------------------------------------------------------------
#  ELAN
#--------------------------------------------------------------

OUTDIR=$OUTVENDOR/elan/$DEVICE
mkdir -p ../../../$OUTDIR/proprietary
MAKEFILE=../../../$OUTDIR/proprietary/Android.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),kai)

#include \$(CLEAR_VARS)
#LOCAL_MODULE := touch_fw
#LOCAL_SRC_FILES := touch_fw.ekt
#LOCAL_MODULE_SUFFIX := .ekt
#LOCAL_MODULE_CLASS := ETC
#LOCAL_MODULE_PATH := \$(TARGET_OUT_ETC)/firmware
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE_OWNER := elan
#include \$(BUILD_PREBUILT)

endif
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/device-partial.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Elan blob(s) necessary for kai hardware
PRODUCT_PACKAGES := \\
#    touch_fw
EOF

MAKEFILE=../../../$OUTDIR/BoardConfigPartial.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
EOF

#--------------------------------------------------------------
#  NXP
#--------------------------------------------------------------

OUTDIR=$OUTVENDOR/nxp/$DEVICE
mkdir -p ../../../$OUTDIR/proprietary
MAKEFILE=../../../$OUTDIR/proprietary/Android.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2011 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := \$(call my-dir)

ifeq (\$(TARGET_DEVICE),kai)

#include \$(CLEAR_VARS)
#LOCAL_MODULE := libpn544_fw
#LOCAL_SRC_FILES := libpn544_fw.so
#LOCAL_MODULE_SUFFIX := .so
#LOCAL_MODULE_CLASS := SHARED_LIBRARIES
#LOCAL_MODULE_PATH := \$(TARGET_OUT_VENDOR)/firmware
#LOCAL_MODULE_TAGS := optional
#LOCAL_MODULE_OWNER := nxp
#include \$(BUILD_PREBUILT)

endif
EOF

#-------------------------------------------------------------------------

MAKEFILE=../../../$OUTDIR/device-partial.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# NXP blob(s) necessary for kai hardware
PRODUCT_PACKAGES := \\
#    libpn544_fw
EOF

MAKEFILE=../../../$OUTDIR/BoardConfigPartial.mk

(cat << EOF) > $MAKEFILE
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
EOF

#-------------------------------------------------------------------------
# MOVE FILES TO RIGHT PLACE
#-------------------------------------------------------------------------

KAIDIR=../../../$OUTVENDOR/$MANUFACTURER/$DEVICE/proprietary

# BROADCOM
TARGET=../../../$OUTVENDOR/broadcom/$DEVICE/proprietary
mv $KAIDIR/bcm4330.hcd $TARGET
mv $KAIDIR/glgps $TARGET
mv $KAIDIR/gps.tegra.so $TARGET
mv $KAIDIR/gpsconfig.xml $TARGET
# NVIDIA
TARGET=../../../$OUTVENDOR/nvidia/$DEVICE/proprietary
mv $KAIDIR/gralloc.tegra.so $TARGET
mv $KAIDIR/hwcomposer.tegra.so $TARGET
mv $KAIDIR/libEGL_tegra.so $TARGET
mv $KAIDIR/libGLESv1_CM_tegra.so $TARGET
mv $KAIDIR/libGLESv2_tegra.so $TARGET
mv $KAIDIR/libardrv_dynamic.so $TARGET
mv $KAIDIR/libcgdrv.so $TARGET
mv $KAIDIR/libnvapputil.so $TARGET
mv $KAIDIR/libnvasfparserhal.so $TARGET
mv $KAIDIR/libnvaviparserhal.so $TARGET
mv $KAIDIR/libnvavp.so $TARGET
mv $KAIDIR/libnvcamerahdr.so $TARGET
mv $KAIDIR/libnvddk_2d.so $TARGET
mv $KAIDIR/libnvddk_2d_v2.so $TARGET
#mv $KAIDIR/libnvdispmgr_d.so $TARGET
mv $KAIDIR/libnvmm.so $TARGET
mv $KAIDIR/libnvmm_audio.so $TARGET
mv $KAIDIR/libnvmm_camera.so $TARGET
mv $KAIDIR/libnvmm_contentpipe.so $TARGET
mv $KAIDIR/libnvmm_image.so $TARGET
mv $KAIDIR/libnvmm_manager.so $TARGET
mv $KAIDIR/libnvmm_misc.so $TARGET
mv $KAIDIR/libnvmm_parser.so $TARGET
mv $KAIDIR/libnvmm_service.so $TARGET
mv $KAIDIR/libnvmm_utils.so $TARGET
mv $KAIDIR/libnvmm_video.so $TARGET
mv $KAIDIR/libnvmm_writer.so $TARGET
mv $KAIDIR/libnvmmlite.so $TARGET
mv $KAIDIR/libnvmmlite_audio.so $TARGET
mv $KAIDIR/libnvmmlite_image.so $TARGET
mv $KAIDIR/libnvmmlite_utils.so $TARGET
mv $KAIDIR/libnvmmlite_video.so $TARGET
mv $KAIDIR/libnvodm_dtvtuner.so $TARGET
mv $KAIDIR/libnvodm_hdmi.so $TARGET
mv $KAIDIR/libnvodm_imager.so $TARGET
mv $KAIDIR/libnvodm_misc.so $TARGET
mv $KAIDIR/libnvodm_query.so $TARGET
mv $KAIDIR/libnvomx.so $TARGET
mv $KAIDIR/libnvomxilclient.so $TARGET
mv $KAIDIR/libnvos.so $TARGET
mv $KAIDIR/libnvparser.so $TARGET
mv $KAIDIR/libnvrm.so $TARGET
mv $KAIDIR/libnvrm_graphics.so $TARGET
mv $KAIDIR/libnvsm.so $TARGET
mv $KAIDIR/libnvtvmr.so $TARGET
mv $KAIDIR/libnvwinsys.so $TARGET
mv $KAIDIR/libnvwsi.so $TARGET
mv $KAIDIR/libstagefrighthw.so $TARGET
mv $KAIDIR/libtf_crypto_sst.so $TARGET
#mv $KAIDIR/nvavp_os_00001000.bin $TARGET
mv $KAIDIR/nvavp_os_0ff00000.bin $TARGET
#mv $KAIDIR/nvavp_os_e0000000.bin $TARGET
mv $KAIDIR/nvavp_os_eff00000.bin $TARGET
mv $KAIDIR/nvavp_vid_ucode_alt.bin $TARGET
mv $KAIDIR/nvavp_vid_ucode.bin $TARGET
mv $KAIDIR/nvcamera.conf $TARGET
mv $KAIDIR/nvram_4330.txt $TARGET
# WIDEVINE
TARGET=../../../$OUTVENDOR/widevine/$DEVICE/proprietary
mv $KAIDIR/libWVStreamControlAPI_L1.so $TARGET
mv $KAIDIR/libdrmdecrypt.so $TARGET
mv $KAIDIR/libwvdrm_L1.so $TARGET
#INVENSENSE
TARGET=../../../$OUTVENDOR/invensense/$DEVICE/proprietary
mv $KAIDIR/libinvensense_hal.so $TARGET
mv $KAIDIR/libmllite.so $TARGET
mv $KAIDIR/libmplmpu.so $TARGET
#LENOVO
TARGET=../../../$OUTVENDOR/lenovo/$DEVICE/proprietary
mv $KAIDIR/sensors.kai.so $TARGET
mv $KAIDIR/lights.kai.so $TARGET
