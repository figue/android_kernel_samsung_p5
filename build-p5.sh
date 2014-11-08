export CROSS_COMPILE=/DATA/android/kernels/gtab/toolchain/arm-unknown-linux-gnueabi-linaro_4.6.4-2013.05/bin/arm-unknown-linux-gnueabi-
export ARCH=arm
export KBUILD_BUILD_USER=Figue
make clean
make mrproper
make figue_p5_defconfig
#cp -v .config_figue3_modem .config
make menuconfig
make -j5
find . -name "*.ko" -exec cp {} ../kernel/system/lib/modules \;
abootimg -u ../kernel/boot.img -k arch/arm/boot/zImage
cp -v arch/arm/boot/zImage ../kernel
