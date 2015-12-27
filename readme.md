# Robot+appium-demo

Basic demo for running robot framework tests with Appium using calculator application for android.
Works & tested with Ubuntu/Linux Mint 17.2

# Required dependencies
* Robot Framework
* Robot Framework appiumlibrary
* Appium
* Android SDK

## Installing dependecies

* TODO...

## APK

* Download apk from here: https://f-droid.org/repo/com.android2.calculator3_63.apk
* Detailed info: https://f-droid.org/repository/browse/?fdfilter=calculator&fdid=com.android2.calculator3
* Original sources: https://github.com/Xlythe/Calculator

## Emulator
Create an emulator device by using the AVD Manager.
* /Android/Sdk/tools$  ./android avd

How to run emulator:
* /Android/Sdk/tools$ ./emulator -avd Nexus_5_API_22

## UI Automation viewer

How to run uiautomationviewer:
* /Android/Sdk/tools$ ./uiautomatorviewer

## Running the demo
pybot robot+appium-demo.robot

## Appium
Start the Appium server before running tests by running command:
* appium
