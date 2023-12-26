*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                     https://automate-test.stpb-digital.com/login
${browser}                 chrome
${locator_user}            id=email
${locator_password}        name=password
${locator_btnlogin}        xpath=//*[@id="btn-login"]
${locator_msg_invalid_user}              css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p
${locator_msg_invalid_password}          css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-tzsjye > p
${locator_msg_login_fail}                xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[1]/p
${locator_msg_login_null}                xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[1]/p
${locator_hyperlink_create_account}      xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[4]/p[2]/a


*** Keywords ***
Open Web Browser
    Set Selenium Speed    0.5s
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

Input Data For Login Page (Fail)
    Input Text       ${locator_user}        user.test@krupbeam.com
    Input Text       ${locator_password}    12345
    Click Element    ${locator_btnlogin}

Input Data For Login Page (User Pass)
    Input Text        ${locator_user}        user.test@krupbeam.com
    Click Element     ${locator_btnlogin} 

Input Data For Login Page (User Fail)
    Input Text        ${locator_user}        user.test.krupbeam.com
    Click Element     ${locator_btnlogin}  

Input Data For Login Page (User Fail2)
    Input Text        ${locator_user}        user@krupbeam.com
    Click Element     ${locator_btnlogin}   

Input Data For Login Page (Password Pass)
    Input Text        ${locator_password}    123456789
    Click Element     ${locator_btnlogin}

Input Data For Login Page (Password Fail)
    Input Text        ${locator_user}        ${EMPTY}
    Input Text        ${locator_password}    ${EMPTY}
    Click Element     ${locator_btnlogin}

Input Data For Login Page (Null)
    Input Text        ${locator_user}        ${EMPTY}
    Input Text        ${locator_password}    ${EMPTY}
    Click Element     ${locator_btnlogin}


*** Test Cases ***
TC-001 - Show Page
    Open Web Browser
    Wait Until Page Contains    Kru P' Beam
    Close Browser

TC-002 - Field User
    Open Web Browser
    Wait Until Element Is Visible    ${locator_password}
    Input Data For Login Page (User Pass)
    Close Browser

TC-003 - Field User Fail
    Open Web Browser
    Wait Until Element Is Visible    ${locator_user}
    Input Data For Login Page (User Fail)
    ${txt}=    Get Text               ${locator_msg_invalid_user}    #สร้างตัวแปรเพื่อเก็บตัวแปรแล้วเอามาเปรียบเทียบกับการแจ้งเตือนของระบบว่าต้องเหมือนกัน
    Should Be Equal As Strings        ${txt}                            email must be a valid email
    Reload Page    #ใช้สำหรับการเทสหลายตัวแปร
    Input Data For Login Page (User Fail2)
    ${txt}=    Get Text              ${locator_msg_invalid_password}
    Should Be Equal As Strings       ${txt}                             password must be at least 5 characters
    Close Browser

TC-004 - Field Password
    Open Web Browser
    Wait Until Element Is Visible    ${locator_user}
    Wait Until Element Is Visible    ${locator_password}
    Input Data For Login Page (Password Pass)
    Close Browser

TC-005 - Field Password Fail
    Open Web Browser
    Wait Until Element Is Visible    ${locator_user}
    Wait Until Element Is Visible    ${locator_password}
    Input Data For Login Page (Password Fail)
    ${txt}=    Get Text              ${locator_msg_invalid_password}
    Should Be Equal As Strings       ${txt}                             password must be at least 5 characters
    Close Browser

TC-006 - Login Button
    Open Web Browser
    Wait Until Element Is Visible    ${locator_user}
    Wait Until Element Is Visible    ${locator_password}
    Input Data For Login Page
    Wait Until Page Contains                                            Search Filters
    Close Browser

TC-007 - Login Button (Fail)
    Open Web Browser
    Wait Until Element Is Visible    ${locator_user}
    Wait Until Element Is Visible    ${locator_password}
    Input Data For Login Page (Fail)
    ${txt}=    Get Text              ${locator_msg_login_fail}
    Should Be Equal As Strings       ${txt}                              Email or Password is invalid
    Close Browser

TC-008 - Login Button (Null)
    Open Web Browser
    Wait Until Element Is Visible    ${locator_user}
    Wait Until Element Is Visible    ${locator_password}
    Input Data For Login Page (Null)
    ${txt}=     Get Text             ${locator_msg_login_null}
    Should Be Equal As Strings       ${txt}                              email is a required field
    ${txt2}=    Get Text             ${locator_msg_invalid_password}
    Should Be Equal As Strings       ${txt2}                             password must be at least 5 characters
    Close Browser

TC-009 - Hyperlink (Create an account)
    Open Web Browser
    Wait Until Element Is Visible    ${locator_hyperlink_create_account}
    Hyperlink Create An Account
    Wait Until Page Contains    Kru P' Beam
    Close Browser
