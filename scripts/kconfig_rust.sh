#!/usr/bin/env bash

KERNEL_PATH="${1:-${HOME}/git/linux}"

CONFIG_SH="${KERNEL_PATH}/scripts/config"

ops=("RUST"
    "AX88796B_PHY"
    "AX88796B_RUST_PHY"
    "BLK_DEV_RUST_NULL"
    "CPUFREQ_DT_RUST"
    "RUST_FW_LOADER_ABSTRACTIONS"
    "RUST_PHYLIB_ABSTRACTIONS"
    "DRM_PANIC"
    "DRM_PANIC_SCREEN_QR_CODE"
    "SAMPLES"
    "SAMPLES_RUST"
)

mods=("SAMPLE_RUST_CONFIGFS"
    "SAMPLE_RUST_DMA"
    "SAMPLE_RUST_DRIVER_AUXILIARY"
    "SAMPLE_RUST_DRIVER_FAUX"
    "SAMPLE_RUST_DRIVER_PCI"
    "SAMPLE_RUST_DRIVER_PLATFORM"
    "SAMPLE_RUST_MINIMAL"
    "SAMPLE_RUST_MISC_DEVICE"
    "SAMPLE_RUST_PRINT"
)

for option in "${ops[@]}"; do
    ${CONFIG_SH} --enable "${option}" --file "${KBUILD_OUTPUT}/.config"
done

for option in "${mods[@]}"; do
    ${CONFIG_SH} --module "${option}" --file "${KBUILD_OUTPUT}/.config"
done
