*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/TestArgument.robot        #เป็นการเรียกใช้งาน Argument จากไฟล์ TestArgument.robot ทำให้เราไม่ต้องมาสร้าง Keyword Open Web Browser ใหม่

*** Variables ***
${url}                 https://www.saucedemo.com/v1/
${browser}             chrome
${locator_user}        id=user-name
${locator_password}    id=password
${locator_userErrorMsg}     xpath=//*[@id="login_button_container"]/div/form/h3
${locator_btn-login}        id=login-button


*** Keywords ***
Open Web Browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Set Selenium Speed    0.5s

Input Data
    #สร้าง Argument 3 ตัวแปร
    [Arguments]    ${user}    ${pass}    ${msg}
    Open Web Browser 
    Wait Until Element Is Visible    ${locator_user}
    Wait Until Element Is Visible    ${locator_password}
    #กรอกข้อมูล User , Pass
    Input Text    ${locator_user}    ${user}
    Input Text    ${locator_password}    ${pass}
    Click Element    ${locator_btn-login}
    #ตรวจสอบว่า ErrorMsg ขึ้นหรือไม่ โดยรอตำแหน่ง ErrorMsg ขึ้น
    Wait Until Element Is Visible    ${locator_userErrorMsg}
    #รับข้อมูลจากเว็บไซต์ โดยดึงข้อมูลของ ErrorMsg
    ${txt}    Get Text    ${locator_userErrorMsg}
    #เปรียบเทียบ ErrorMsg ใน Requirement กับ การแสดงผลจริง
    Should Be Equal As Strings    ${txt}    ${msg}
    Close Browser


*** Test Cases ***
Verify input data fail
    [Template]    Input Data
    ${EMPTY}     ${EMPTY}     Epic sadface: Username is required
    kkkkk        ${EMPTY}     Epic sadface: Password is required   
    aaaa         123          Epic sadface: Username and password do not match any user in this service