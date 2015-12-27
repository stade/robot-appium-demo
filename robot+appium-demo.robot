*** Settings ***
Library           AppiumLibrary

*** Variables ***
${REMOTE_URL}     http://localhost:4723/wd/hub
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    4.2.2
${DEVICE_NAME}    Android Emulator
${APP}            ${EXECDIR}/apk/com.android2.calculator3_63.apk

*** Test Cases ***
Demo
    [Tags]   demo
    Open Calculator Application
    Sleep    5
    Capture Page Screenshot
    [Teardown]    Close Application

*** Keywords ***
Open Calculator Application
    Open Application
    ...    ${REMOTE_URL}
    ...    platformName=Android
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=192.168.58.101:5555
    ...    app=${APP}
    ...    automationName=appium
