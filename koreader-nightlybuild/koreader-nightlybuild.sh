#!/bin/sh

source ./koreader-nightlybuild.conf

echo "clone koreader to dev directory"
cd ~/dev
rm -rf koreader
git clone git://github.com/koreader/koreader.git
cd koreader
echo "compile and build customupdate"
PATH="/opt/arm-2012.03/bin:$PATH"
USE_FIXED_POINT=1
make fetchthirdparty
make customupdate
korzip=`find koreader*.zip |sort -r |head -1`
# upload to Google code
~/bin/googlecode_upload.py -s $SUMMARY -p $PROJECT -u $USER -w $PASSWORD $korzip
