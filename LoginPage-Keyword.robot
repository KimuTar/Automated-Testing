*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/LoginPage-Variable.robot

*** Keywords ***
Open Web Browser
    [Arguments]     ${url}    ${browser}
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains    Welcome to Kru P' Beam!

Hyperlink Create An Account
    Click Link    ${locator_hyperlink_create_account}

Input Data For Login Page
    #ใช้คำสั่ง        ส่ง locator        ส่งข้อความ text
    Input Text       ${locator_user}        user.test@krupbeam.com
    Input Text       ${locator_password}    123456789
    Click Element    ${locator_btnlogin}

# Input Data For Login Page (Fail)
#     Input Text       ${locator_user}        user.test@krupbeam.com
#     Input Text       ${locator_password}    12345
#     Click Element    ${locator_btnlogin}

Input Data For Login Page (User Pass)
    Input Text        ${locator_user}        user.test@krupbeam.com
    Click Element     ${locator_btnlogin} 

# Input Data For Login Page (User Fail)
#     Input Text        ${locator_user}        user.test.krupbeam.com
#     Click Element     ${locator_btnlogin}  

# Input Data For Login Page (User Fail2)
#     Input Text        ${locator_user}        user@krupbeam.com
#     Click Element     ${locator_btnlogin}   

Input Data For Login Page (Password Pass)
    Input Text        ${locator_password}    123456789
    Click Element     ${locator_btnlogin}

# Input Data For Login Page (Password Fail)
#     Input Text        ${locator_user}        ${EMPTY}
#     Input Text        ${locator_password}    ${EMPTY}
#     Click Element     ${locator_btnlogin}

# Input Data For Login Page (Null)
#     Input Text        ${locator_user}        ${EMPTY}
#     Input Text        ${locator_password}    ${EMPTY}
#     Click Element     ${locator_btnlogin}

Verify Error Msg
    [Arguments]    ${locator}    ${msg}
    ${txt}=    Get Text    ${locator}
    Should Be Equal As Strings    ${txt}    ${msg}
    

Input Data For Login Fail
    [Arguments]    ${user}    ${pass}    ${locator}    ${msg}
    Open Web Browser    ${url_login}    ${browser}
    Wait Until Element Is Visible    ${locator_user}    3s
    Input Text                       ${locator_user}        ${user}
    Input Text                       ${locator_password}    ${pass}
    Click Element                    ${locator_btnlogin}
    Verify Error Msg    ${locator}    ${msg}
    Close Browser