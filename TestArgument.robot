*** Settings ***   
Library    SeleniumLibrary


*** Variables ***
${url}                      https://www.saucedemo.com/v1/
${browser}                  chrome
${locator_user}             id=user-name
${locator_password}         id=password
${locator_userErrorMsg}     xpath=//*[@id="login_button_container"]/div/form/h3
${locator_btn-login}        id=login-button

*** Keywords ***
Open Web Browser
    [Arguments]    ${link}    ${browsername}   #ทำเพื่อถ้าเกิดเราอยากจะเทส เว็บอื่นๆ ที่ไฟล์ใหม่ๆ เราก็ไม่ต้องมาแก้ไข url ก็ใช้คำสั่ง Open web browser ได้เลย
    Open Browser    ${link}    ${browsername}
    Set Selenium Speed    2s
    Maximize Browser Window

Input Data
    [Arguments]    ${user}    ${txt1}    ${password}    ${txt2}
    Wait Until Element Is Visible    ${user}
    Input Text    ${user}    ${txt1}
    Wait Until Element Is Visible    ${password}
    Input Text    ${password}    ${txt2}
    Click Element    ${locator_btn-login}

Verify Check ErrorMsg
    [Arguments]    ${error}    ${txt}
    Wait Until Element Is Visible    ${error}
    ${text}    Get Text    ${error}
    Should Be Equal As Strings    ${text}    ${txt}



*** Test Cases ***
Verify Input Data
    Open Web Browser    ${url}    ${browser}
    Input Data    ${locator_user}    ${EMPTY}    ${locator_password}    ${EMPTY}
    Verify Check ErrorMsg    ${locator_userErrorMsg}    Epic sadface: Username is required
    Close Browser

Verify Input Data Fail
    Open Web Browser    ${url}    ${browser}
    Input Data    ${locator_user}    mmmmm    ${locator_password}    1234
    Verify Check ErrorMsg    ${locator_userErrorMsg}    Epic sadface: Username and password do not match any user in this service
    Close Browser

