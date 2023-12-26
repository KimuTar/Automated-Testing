*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
TC-FB
    Open Browser    https://th-th.facebook.com/reg/    chrome
    Wait Until Element Is Visible    id=day    5s
    Select From List By Index    id=day    6     #ค่า index จะเริ่มที่ 0 ถ้าจะเลือกวันที่ 7 Index ต้องเป็น 6
    Select From List By Label    id=month    เม.ย.
    Select From List By Value    id=year    2014
    Sleep    5s    #คำสั่งเพื่อให้รอดู 5 วินาที
    Close Browser

TC-Register Kru P'Beam
    Open Browser    https://automate-test.stpb-digital.com/register/    chrome
    Wait Until Element Is Visible    id=select-role    5s
    Click Element    id=select-role
    Wait Until Element Is Visible    xpath=//*[@id="menu-"]/div[3]/ul/li[3]    5s
    Click Element    xpath=//*[@id="menu-"]/div[3]/ul/li[3]
    Sleep    5s
    Close Browser

TC-Search
    Set Selenium Speed    1s
    Open Browser    https://automate-test.stpb-digital.com/login/    chrome
    Input Text    id=email    user.test@krupbeam.com
    Input Text    name=password    123456789
    Click Element    id=btn-login
    Wait Until Page Contains    Search Filters
    Click Element    id=select-plan
    Wait Until Element Is Visible    id=option-select-plan-1    5s
    Click Element    id=option-select-plan-1
    Sleep    5s
    Close Browser

Tc-Ebay
    Set Selenium Speed    1s
    Open Browser    https://www.ebay.com/    chrome
    Select From List By Value    id=gh-cat    237
    Click Element    id=gh-btn
    Sleep    5s
    Close Browser

