export CROSS_COMPILE=/DATA/android/kernels/gtab/toolchain/arm-unknown-linux-gnueabi-linaro_4.6.4-2013.05/bin/arm-unknown-linux-gnueabi-
export ARCH=arm
export KBUILD_BUILD_USER=Figue
#make clean
#make mrproper
make figue_defconfig
make menuconfig
make -j5
find . -name "*.ko" -exec cp {} ../kernel/system/lib/modules \;
cp -v arch/arm/boot/zImage ../kernel
cp -v ../boot.img .
abootimg -u boot.img -k arch/arm/boot/zImage
cp -v boot.img ../kernel/
