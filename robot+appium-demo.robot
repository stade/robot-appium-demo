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
${CLEAR_BUTTON_EMULATOR}    xpath=//*[@text='CLEAR']
${CLEAR_BUTTON_DEVICE}    xpath=//*[@text='CLR']

*** Test Cases ***
1+1=2 With Emulator
    [Tags]   Emulator    Demo
    Click Buttons With Texts    1    +    1    =
    Result Should Be    2

100/10=10 With Emulator
    [Tags]   Emulator    Demo
    Click Buttons With Texts     1    0    0     ÷    1    0    =
    Result Should Be    10

6×6=36 With Emulator
    [Tags]   Emulator    Demo
    Click Buttons With Texts    6    ×    6    =
    Result Should Be    36

50−55=−5 With Emulator
    [Tags]   Emulator    Demo
    Click Buttons With Texts    5    0    −    5    5    =
    Result Should Be    −5

10.10×10.10=102.01 With Emulator
    [Tags]   Emulator    Demo
    Click Buttons With Texts     1    0    .    1    0    ×    1    0    .   1    0    =
    Result Should Be    102.01

1+1=2 With Device
    [Tags]    Device    Demo
    Click Buttons With Texts    1    +    1    =
    Result Should Be    2

100/10=10 With Device
    [Tags]    Device    Demo
    Click Buttons With Texts     1    0    0     ÷    1    0    =
    Result Should Be    10

6×6=36 With Device
    [Tags]    Device    Demo
    Click Buttons With Texts    6    ×    6    =
    Result Should Be    36

50−55=−5 With Device
    [Tags]    Device    Demo
    Click Buttons With Texts    5    0    −    5    5    =
    Result Should Be    −5

10,10×10,10=102,01 With Device
    [Tags]    Device    Demo
    Click Buttons With Texts     1    0    ,    1    0    ×    1    0    ,   1    0    =
    Result Should Be    102,01

*** Keywords ***
Click Buttons With Texts
    [Arguments]    @{texts}
    :FOR    ${text}    IN    @{texts}
    \    Click Button With Text    ${text}

Clear Calculator
    [Documentation]    Device and Emulator contain different button texts for clear button.
    ${passed}=    Run Keyword And Return Status    Click Element    ${CLEAR_BUTTON_EMULATOR}
    Run Keyword Unless    ${passed}    Click Element    ${CLEAR_BUTTON_DEVICE}

Result Should Be
    [Arguments]    ${expected}
    Element Attribute Should Match    ${RESULT_AREA}    text    ${expected}

Click Button With Text
    [Arguments]    ${text}
    Wait Until Page Contains Element    xpath=//android.widget.Button[@text='${text}']    10 s
    Click Element    xpath=//android.widget.Button[@text='${text}']

Hide Startup Notification
    Click Element    ${OK_BUTTON}

Open Calculator Application
    Open Application
    ...    ${REMOTE_URL}
    ...    platformName=${PLATFORM_NAME}
    ...    platformVersion=${PLATFORM_VERSION}
    ...    deviceName=${DEVICE_NAME}
    ...    app=${APP}
    ...    automationName=appium
