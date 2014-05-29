#!/bin/sh

koreader_repo="git://github.com/koreader/koreader.git"

export ANDROID_SDK_ROOT=/home/matrix/dev/android-sdk-linux
export PATH=$ANDROID_SDK_ROOT/tools:$PATH
export NDK=/home/matrix/dev/android-ndk-r9d

export USE_NO_CCACHE=1

echo "clone koreader to dev directory"
cd ~/dev
git clone $koreader_repo && cd koreader || cd koreader && git fetch origin
git reset --hard origin/master

echo "compile and build customupdate for kindle"
make clean
make TARGET=kindle fetchthirdparty kindleupdate 

echo "compile and build koboupdate"
make clean
make TARGET=kobo fetchthirdparty koboupdate 

echo "compile and build androidupdate"
make clean
make TARGET=android fetchthirdparty androidupdate
