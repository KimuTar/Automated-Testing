*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}            https://www.google.com/?hl=th
${browser}        chrome
${locator_search}    name=q
${locator_result}    id=wob_loc

*** Keywords ***
Open google
    Set Selenium Speed    0.2s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains Element    ${locator_search}

Input data
    [Documentation]    ใช้สำหรับการกรอกข้อมูลสภาพอากาศ
    [Arguments]    ${keyword}
    Input Text    ${locator_search}    ${keyword}
    Press Keys    ${locator_search}    ENTER
    Wait Until Page Contains    สภาพอากาศ


*** Test Cases ***
Verify Input Data - ChiangRai
    [Documentation]    ใช้สำหรับตรวจสอบการกรอกข้อมูลสภาพอากาศเชียงราย
    [Tags]    Done
    Open google
    Input data    สภาพอากาศเชียงราย
    Close Browser

Verify Input Data - Bangkok
    [Documentation]    ใช้สำหรับตรวจสอบการกรอกข้อมูลสภาพอากาศกรุงเทพ
    [Tags]    Failed
    Open google
    Input data    สภาพอากาศกรุงเทพ
    Close Browser