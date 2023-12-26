*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                     https://automate-test.stpb-digital.com/login
${browser}                 chrome
${locator_email}           id=email
${locator_password}        name=password
${locator_btnlogin}        xpath=//*[@id="btn-login"]
${locator_emailErrorMsg}             css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p
${locator_passwordErrorMsg}          css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-tzsjye > p
${locator_linkRegister}              xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[4]/p[2]/a


*** Keywords ***
Open Web Browser
    Set Selenium Speed    0.3s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains    Welcome to Kru P' Beam!

Input Data For Login
    #ใช้คำสั่ง        ส่ง locator        ส่งข้อความ text
    ${p}    Set Variable    ${123456789}    #**** สร้างตัวแปรขึ้นมาใช้สำหรับการป้องกันการแสดงรหัสผ่านในหน้า Report *****
    Wait Until Element Is Visible           ${locator_email}
    Wait Until Element Is Visible           ${locator_password}
    Input Text       ${locator_email}        user.test@krupbeam.com
    Input Text       ${locator_password}    ${p}
    Click Element    ${locator_btnlogin}
    Wait Until Page Contains                Search Filters

Input Email - Fail
    Wait Until Element Is Visible    ${locator_email}
    Input Text                       ${locator_email}             user.test.krupbeam.com
    Click Element                    ${locator_btnlogin}
    Wait Until Element Is Visible    ${locator_emailErrorMsg} 
    ${txt}=    Get Text              ${locator_emailErrorMsg}
    Should Be Equal As Strings       ${txt}                       email must be a valid email

Input Password - Fail
    Wait Until Element Is Visible    ${locator_password}
    ${txt}    Set Variable    123
    Input Password                   ${locator_password}    ${txt}       
    Click Element                    ${locator_btnlogin}
    Wait Until Element Is Visible    ${locator_passwordErrorMsg} 
    ${txt2}=    Get Text             ${locator_passwordErrorMsg}
    Should Be Equal As Strings       ${txt2}                       password must be at least 5 characters

Link Register
    Wait Until Element Is Visible    ${locator_linkRegister}
    Click Element                    ${locator_linkRegister}
    Wait Until Page Contains         Kru P' Beam

Verify input data
    Wait Until Element Is Visible        ${locator_email}
    Wait Until Element Is Visible        ${locator_password}
    Input Text    ${locator_email}       ${EMPTY}
    Input Text    ${locator_password}    ${EMPTY}
    Click Element    ${locator_btnlogin}
    Wait Until Element Is Visible    ${locator_emailErrorMsg}
    ${erroremail}=    Get Text       ${locator_emailErrorMsg}
    Wait Until Element Is Visible    ${locator_passwordErrorMsg}
    ${errorpass}=     Get Text       ${locator_passwordErrorMsg}
    Should Be Equal As Strings       ${erroremail}    email is a required field
    Should Be Equal As Strings       ${errorpass}     password must be at least 5 characters

Verify input data - pass
    Open Web Browser
    Input Data For Login
    Close Browser

*** Test Cases ***
Open Login Page
    Open Web Browser
    Wait Until Page Contains    Welcome to Kru P' Beam!
    Wait Until Element Is Visible    ${locator_email}
    Wait Until Element Is Visible    ${locator_password}
    Wait Until Element Is Visible    ${locator_btnlogin}
    Wait Until Element Is Visible    ${locator_linkRegister}
    Close Browser

Input Email data - Fail
    Open Web Browser
    Input Email - Fail
    Close Browser

Input Password data - Fail
    Open Web Browser
    Input Password - Fail
    Close Browser

Verify data
    Open Web Browser
    Verify input data
    Close Browser

Hyperlink Register
    Open Web Browser
    Link Register
    Close Browser
    


