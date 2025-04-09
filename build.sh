#!/bin/bash

APK_NAME="framework-res__auto_generated_rro"
rm -f -v ${APK_NAME}-unaligned.apk ${APK_NAME}.apk.idsig
#sdkmanager --verbose --install "platforms;android-28"
aapt package -v -M AndroidManifest.xml -S res --min-sdk-version 28 --target-sdk-version 28 -I $ANDROID_SDK_ROOT/platforms/android-28/android.jar -F ${APK_NAME}-unaligned.apk
zipalign -v 4 ${APK_NAME}-unaligned.apk ${APK_NAME}.apk
apksigner sign -v --v1-signing-enabled false --key testdata/testkey.pk8 --cert testdata/testkey.x509.pem ${APK_NAME}.apk
rm -f -v ${APK_NAME}-unaligned.apk ${APK_NAME}.apk.idsig
