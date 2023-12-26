*** Settings ***
Library           SeleniumLibrary
Suite Setup       Set Selenium Speed    0.2s
Test Setup        Open Google Calculator
Test Teardown     Close Browser
Suite Teardown    Close All Browsers

*** Variables ***
${url}               https://www.google.com/
${browser}           chrome
${locator_search}    id=APjFqb
${locator_2}         xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[2]/div/div
${locator_4}         xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[3]/td[1]/div/div
${locator_plus}      xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[5]/td[4]/div/div
${locator_minus}     xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[4]/td[4]/div/div
${locator_multi}     xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[3]/td[4]/div/div
${locator_diff}      xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[2]/td[4]/div/div
${locator_equal}     xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[5]/td[3]/div/div
${locator_ac}        xpath=//*[@id="rso"]/div[1]/div/div/div/div[1]/div/div/div[3]/div/table[2]/tbody/tr[1]/td[4]/div/div[1]
${locator_result}    id=cwos

*** Keywords ***
Open Google Calculator
    [Documentation]           ทำการเปิด Google calculator
    [Tags]                    Open Goolge Calculator
    Open Browser              ${url}    ${browser}                                #เรียกใช้คำสั่ง Open Browser เพื่อทำการเปิด google chrome
    Maximize Browser Window                                                       #ใช้คำสั่งเพื่อขยาย Browser ให้เต็มจอ

Input Keyword For Search
    [Documentation]           กรอกข้อความ calculator
    [Tags]                    search
    Wait Until Element Is Visible    ${locator_search}                            #ใช้คำสั่งรอ เพื่อให้หน้าจอแสดงช่องค้นหา
    Input Text                       ${locator_search}    google calculator       #พิมพ์ google calculator ที่ช่องค้นหา
    Press Keys                       ${locator_search}    ENTER                   #กด enter
    Wait Until Page Contains         calculator                                   #รอให้หน้าจอปรากฎคำว่า calculator

Verify Check Result Calculator - Plus
    [Documentation]    ใช้สำหรับทดสอบการบวกเลข
    [Tags]             +
    Click Element    ${locator_4}                 #ให้ Robot ทำการกดปุ่มเลข 4
    Click Element    ${locator_plus}              #ให้ Robot ทำการกดปุ่มเครื่องหมาย +
    Click Element    ${locator_2}                 #ให้ Robot ทำการกดปุ่มเลข 2
    Click Element    ${locator_equal}             #ให้ Robot ทำการกดปุ่มเครื่องหมาย =
    ${ans}=    Get Text    ${locator_result}      #ทำการสร้างตัวแปร ${ans} เพื่อเก็บผลลัพธ์ที่ได้ เพื่อนำมาเปรียบเทียบค่า
    Should Be Equal As Integers    6    ${ans}    #ทำการตรวจสอบค่าผลลัพธ์ที่ได้ กับความตอบที่ถูกต้อง
    Close Browser                                 #ทำการปิด Browser

Verify Check Result Calculator - Minus
    [Documentation]    ใช้สำหรับทดสอบการลบเลข
    [Tags]             minus
    Click Element    ${locator_4}                 #ให้ Robot ทำการกดปุ่มเลข 4
    Click Element    ${locator_minus}              #ให้ Robot ทำการกดปุ่มเครื่องหมาย -
    Click Element    ${locator_2}                 #ให้ Robot ทำการกดปุ่มเลข 2
    Click Element    ${locator_equal}             #ให้ Robot ทำการกดปุ่มเครื่องหมาย =
    ${ans}=    Get Text    ${locator_result}      #ทำการสร้างตัวแปร ${ans} เพื่อเก็บผลลัพธ์ที่ได้ เพื่อนำมาเปรียบเทียบค่า
    Should Be Equal As Integers    2    ${ans}    #ทำการตรวจสอบค่าผลลัพธ์ที่ได้ กับความตอบที่ถูกต้อง
    Close Browser                                 #ทำการปิด Browser

Verify Check Result Calculator - Multiple
    [Documentation]    ใช้สำหรับทดสอบการคูณเลข
    [Tags]             x
    Click Element    ${locator_4}                 #ให้ Robot ทำการกดปุ่มเลข 4
    Click Element    ${locator_multi}              #ให้ Robot ทำการกดปุ่มเครื่องหมาย x
    Click Element    ${locator_2}                 #ให้ Robot ทำการกดปุ่มเลข 2
    Click Element    ${locator_equal}             #ให้ Robot ทำการกดปุ่มเครื่องหมาย =
    ${ans}=    Get Text    ${locator_result}      #ทำการสร้างตัวแปร ${ans} เพื่อเก็บผลลัพธ์ที่ได้ เพื่อนำมาเปรียบเทียบค่า
    Should Be Equal As Integers    8    ${ans}    #ทำการตรวจสอบค่าผลลัพธ์ที่ได้ กับความตอบที่ถูกต้อง
    Close Browser                                 #ทำการปิด Browser

Verify Check Result Calculator - Diff
    [Documentation]    ใช้สำหรับทดสอบการหารเลข
    [Tags]             /
    Click Element    ${locator_4}                 #ให้ Robot ทำการกดปุ่มเลข 4
    Click Element    ${locator_diff}              #ให้ Robot ทำการกดปุ่มเครื่องหมาย /
    Click Element    ${locator_2}                 #ให้ Robot ทำการกดปุ่มเลข 2
    Click Element    ${locator_equal}             #ให้ Robot ทำการกดปุ่มเครื่องหมาย =
    ${ans}=    Get Text    ${locator_result}      #ทำการสร้างตัวแปร ${ans} เพื่อเก็บผลลัพธ์ที่ได้ เพื่อนำมาเปรียบเทียบค่า
    Should Be Equal As Integers    2    ${ans}    #ทำการตรวจสอบค่าผลลัพธ์ที่ได้ กับความตอบที่ถูกต้อง
    Close Browser                                 #ทำการปิด Browser


*** Test Cases ***    
TC-Open Web Google calculator
    [Documentation]    ทดสอบการเปิด Web Browser
    Input Keyword For Search

TC-Verify Check Result Calculator Plus
    [Documentation]    ทดสอบการคำนวณการบวก
    Input Keyword For Search
    Verify Check Result Calculator - Plus
    
TC_Verify Check Result Calculator Minus
    [Documentation]    ทดสอบการคำนวณการลบ
    Input Keyword For Search
    Verify Check Result Calculator - Minus

TC_Verify Check Result Calculator Multiple
    [Documentation]    ทดสอบการคำนวณการคูณ
    Input Keyword For Search
    Verify Check Result Calculator - Multiple

TC_Verify Check Result Calculator Diff
    [Documentation]    ทดสอบการคำนวณการหาร
    Input Keyword For Search
    Verify Check Result Calculator - Diff