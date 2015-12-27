*** Settings ***
Library    AppiumLibrary
Suite Setup    Run Keywords    Open Calculator Application    Hide Startup Notification
Suite Teardown    Close All Applications
Test Teardown    Clear Calculator

*** Variables ***
${REMOTE_URL}     http://localhost:4723/wd/hub
${PLATFORM_NAME}    Android
${PLATFORM_VERSION}    4.2.2
${DEVICE_NAME}    Android Emulator
${APP}            ${EXECDIR}/apk/com.android2.calculator3_63.apk
${OK_BUTTON}    xpath=//*[@text='OK']
${RESULT_AREA}    xpath=//android.widget.EditText
${CLEAR_BUTTON}    xpath=//*[@text='CLEAR']

*** Test Cases ***
1+1=2
    [Tags]   Demo
    Click Button With Text    1
    Click Button With Text    +
    Click Button With Text    1
    Click Button With Text    =
    Result Should Be    2

100/10=10
    [Tags]   Demo
    Click Button With Text    1
    Click Button With Text    0
    Click Button With Text    0
    Click Button With Text    ÷
    Click Button With Text    1
    Click Button With Text    0
    Click Button With Text    =
    Result Should Be    10

6×6=36
    [Tags]   Demo
    Click Button With Text    6
    Click Button With Text    ×
    Click Button With Text    6
    Click Button With Text    =
    Result Should Be    36

50−55=−5
    [Tags]   Demo
    Click Button With Text    5
    Click Button With Text    0
    Click Button With Text    −
    Click Button With Text    5
    Click Button With Text    5
    Click Button With Text    =
    Result Should Be    −5

10.10×10.10=102.01
    [Tags]   Demo
    Click Button With Text    1
    Click Button With Text    0
    Click Button With Text    .
    Click Button With Text    1
    Click Button With Text    0
    Click Button With Text    ×
    Click Button With Text    1
    Click Button With Text    0
    Click Button With Text    .
    Click Button With Text    1
    Click Button With Text    0
    Click Button With Text    =
    Result Should Be    102.01

*** Keywords ***
Clear Calculator
    Click Element    ${CLEAR_BUTTON}

Result Should Be
    [Arguments]    ${expected}
    Element Attribute Should Match    ${RESULT_AREA}    text    ${expected}

Click Button With Text
    [Arguments]    ${text}
    Click Element    xpath=//android.widget.Button[@text='${text}']

Hide Startup Notification
    Click Element    ${OK_BUTTON}

Open Calculator Application
    Open Application
    ...    ${REMOTE_URL}
    ...    platformName=Android
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=192.168.58.101:5555
    ...    app=${APP}
    ...    automationName=appium
