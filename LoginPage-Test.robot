*** Settings ***
Library           SeleniumLibrary
Resource          ${CURDIR}/LoginPage-Variable.robot
Resource          ${CURDIR}/LoginPage-Keyword.robot
Suite Setup       Set Selenium Speed    0.2s
Test Setup        Open Web Browser    ${url_login}    ${browser}
Test Teardown     Close Browser
Suite Teardown    Close All Browsers

*** Test Cases ***
TC - Login Pass
    Input Data For Login Page

TC - Login Fail
    [Documentation]    ใช้สำหรับหน้าจอ Login Fail
    [Tags]    Login Fail
    [Setup]
    [Template]    Input Data For Login Fail
    user@krupbeam.com        123456789    ${locator_msg_invalid_user}        Email or Password is invalid
    user.test.krupbeam.com   123456789    ${locator_msg_invalid_user}        email must be a valid email
    user.test.krupbeam.com   123          ${locator_msg_invalid_password}    password must be at least 5 characters
    ${EMPTY}                 ${EMPTY}     ${locator_msg_invalid_user}        email is a required field
    [Teardown]

TC - Verify Login Web Kru P' Beam Register
    Wait Until Element Is Visible    ${locator_hyperlink_create_account}    2s
    Click Element    ${locator_hyperlink_create_account}    
    Wait Until Page Contains    Kru P' Beam    2s