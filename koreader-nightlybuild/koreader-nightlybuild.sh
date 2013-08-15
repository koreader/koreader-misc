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
USE_NO_CCACHE=1
make fetchthirdparty
make
make customupdate
make koboupdate
kindlezip=`find koreader-kindle*.zip |sort -r |head -1`
kobozip=`find koreader-kobo*.zip |sort -r |head -1`
# upload to Google code
~/bin/googlecode_upload.py -s $SUMMARY -p $PROJECT -u $USER -w $PASSWORD $kobozip
~/bin/googlecode_upload.py -s $SUMMARY -p $PROJECT -u $USER -w $PASSWORD $kindlezip
