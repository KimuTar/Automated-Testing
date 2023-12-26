*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}    https://automate-test.stpb-digital.com/login
${browser}    chrome
${locator_email}    id=email
${locator_password}    name=password
${locator_btnlogin}    id=btn-login
${locator_msg_email}    css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p

*** Keywords ***
Open Web Browser
    Set Selenium Speed    1s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Input Data for login page
    #ใช้คำสั่ง        ส่ง locator            ส่งข้อความ text
    Input Text    ${locator_email}    user.test@krupbeam.com
    Input Text    ${locator_password}    123456789
    Click Element    ${locator_btnlogin}                                            
    #ใช้ click element ดีกว่า click button เพราะสามารถใช้กับ checkbox dropdownlist ได้ด้วย

Input Data for login page failed
    #ใช้คำสั่ง        ส่ง locator            ส่งข้อความ text
    Input Text    ${locator_email}    user555@krupbeam.com
    Input Text    ${locator_password}    123456789
    Click Element    ${locator_btnlogin}                                            

*** Test Cases ***
TC-001 - login
    Open Web Browser
    Input Data for login page
    Close Browser

TC-002 - login failed (No user)
    Open Web Browser
    Input Data for login page failed
    ${txt}=    Get Text    ${locator_msg_email}
    Should Be Equal As Strings    ${txt}    Email or Password is invalid
    Close Browser

