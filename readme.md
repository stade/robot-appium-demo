# Robot+appium-demo

Basic demo for running robot framework tests with Appium using calculator application for android.

Demo is developed and works at least with following environments:
* Ubuntu/Linux Mint 17.2 OS
* Nexus 5 emulator and real Nexus 5 device.

# Required dependencies
* Robot Framework
* Robot Framework appiumlibrary
* Appium
* Android SDK

## Installing dependencies

* ```pip install robotframework-appiumlibrary```
*  install appium & node:    http://stackoverflow.com/a/30374094
*  install android tools etc: http://bernaerts.dyndns.org/linux/74-ubuntu/328-ubuntu-trusty-android-adb-fastboot-qtadb
*  add to path (.bashrc etc.):
* ```export ANDROID_HOME=/home/username/Android/Sdk```
* ```export PATH=$PATH:/usr/local/adt/android-studio/bin```

## APK

* Download apk from here: https://f-droid.org/repo/com.android2.calculator3_63.apk
* Detailed info: https://f-droid.org/repository/browse/?fdfilter=calculator&fdid=com.android2.calculator3
* Original sources: https://github.com/Xlythe/Calculator

## Emulator
Create an emulator device by using the AVD Manager:
* ```/Android/Sdk/tools$  ./android avd```

How to run emulator:
* ```/Android/Sdk/tools$ ./emulator -avd Nexus_5_API_22```

## UI Automation viewer

How to run uiautomationviewer:
* ``` /Android/Sdk/tools$ ./uiautomatorviewer```

## Running the demo with emulator or device.

Use *emulator* test tag to run tests with emulator:
* ```pybot -i emulator robot+appium-demo.robot```

Use *device* test tag to run tests with device:
* ```pybot -i device robot+appium-demo.robot```

## Appium
Start the Appium server before running tests by running command:
* ```appium```
