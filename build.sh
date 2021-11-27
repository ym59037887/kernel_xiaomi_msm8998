sudo apt install openssl make python libssh-dev unzip git wget build-essential zip bc
git clone https://github.com/kdrag0n/proton-clang.git builder --depth=1
export ARCH=arm64
export SUBARCH=arm64
export PATH="${PWD}/builder/bin:$PATH"
make -j48 O=out CC=clang CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi- chiron_defconfig
make -j48 O=out CC=clang CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE_ARM32=arm-linux-gnueabi-
cp out/arch/arm64/boot/Image.gz-dtb anykernel/Image.gz-dtb
cd anykernel
zip -q -r Kernel.zip ./*
cp Kernel.zip ~
