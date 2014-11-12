#!/bin/sh

koreader_repo="git://github.com/koreader/koreader.git"

export ANDROID_SDK_ROOT=/home/matrix/dev/android-sdk-linux
export NDK=/home/matrix/dev/android-ndk-r9d
export PATH=$ANDROID_SDK_ROOT/tools:$NDK:$PATH

#export USE_NO_CCACHE=1

echo "clone koreader to dev directory"
cd ~/dev
git clone $koreader_repo && cd koreader || cd koreader && git fetch origin
git reset --hard origin/master
make fetchthirdparty

echo "update resource file in Transifex"
make pot 

echo "grab the latest translations"
make po

echo "compile and build kindleupdate"
make TARGET=kindle clean fetchthirdparty kindleupdate 

echo "compile and build koboupdate"
make TARGET=kobo clean fetchthirdparty koboupdate

echo "compile and build androidupdate"
make TARGET=android clean fetchthirdparty androidupdate
