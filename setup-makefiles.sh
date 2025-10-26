#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=gta8wifi
VENDOR=samsung

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../../.."

cp $ANDROID_ROOT/tools/extract-utils/templates/single-device/setup-makefiles.py $ANDROID_ROOT/tools/extract-utils/setup-makefiles.py

HELPER="${ANDROID_ROOT}/tools/extract-utils/setup-makefiles.py"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
python3 "${HELPER}"

# Initialize the helper
#setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}"

# Warning headers and guards
#write_headers

#write_makefiles "${MY_DIR}/proprietary-files.txt" true

# Finish
#write_footers
