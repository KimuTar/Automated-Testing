*** Settings ***
Library    SeleniumLibrary
Library    ExcelRobot

*** Variables ***
${url_login}                     https://automate-test.stpb-digital.com/login
${browser}                 chrome
${locator_user}            id=email
${locator_password}        name=password
${locator_btnlogin}        xpath=//*[@id="btn-login"]
${locator_msg_invalid_user}              css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-m5bgtg > p
${locator_msg_invalid_password}          css=#__next > div.layout-wrapper.MuiBox-root.css-33gw4 > div > div > div > div > div > form > div.MuiFormControl-root.MuiFormControl-fullWidth.css-tzsjye > p
${locator_msg_login_fail}                xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[1]/p
${locator_msg_login_null}                xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[1]/p
${locator_hyperlink_create_account}      xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[4]/p[2]/a
${path}         ${EXECDIR}/testdatalogin.xls
${sheetname}    Sheet1

*** Keywords ***
Open Web Browser
    Open Browser    ${url_login}    ${browser}
    Maximize Browser Window

Input Data For Test Login
    [Arguments]    ${user}    ${pass}    ${msg}
    Open Web Browser
    Wait Until Page Contains    Welcome to Kru P' Beam    1s
    Wait Until Element Is Visible    ${locator_user}
    Input Text       ${locator_user}        ${user}
    Input Text       ${locator_password}    ${pass}
    Click Element    ${locator_btnlogin}
    ${txt}=    Get Text    ${locator_msg_invalid_user}
    Should Be Equal As Strings    ${txt}    ${msg}
    Close Browser

Get Data From ExcelRobot
    Open Excel    ${path}
    ${rowcount}=    Get Row Count    ${sheetname}    #ใช้นับจำนวนแถวภายในไฟล์ Excel
    FOR  ${item}  IN RANGE    0    ${rowcount}    #เลข 0 หมายถึงตำแหน่งที่เริ่มนับ โดยแถวที่ 1 เริ่มต้นด้วยเลข 0
         ${user}    Read Cell Data    ${sheetname}    0    ${item}    #เลข 0 คือเริ่มจาก Column ที่ A
         ${pass}    Read Cell Data    ${sheetname}    1    ${item}    #เลข 1 คือเริ่มจาก Column ที่ B
         ${msg}     Read Cell Data    ${sheetname}    2    ${item}
        #  Log To Console    ${user}    #เอาไว้ Test ดูผลที่ console
        #  Log To Console    ${pass}    #เอาไว้ Test ดูผลที่ console
        #  Log To Console    ${msg}    #เอาไว้ Test ดูผลที่ console
        Input Data For Test Login    ${user}    ${pass}    ${msg}
    
    END

*** Test Cases ***
Test Run
    Get Data From ExcelRobot
    