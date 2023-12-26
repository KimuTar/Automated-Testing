*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/Workshop3-Variable.robot

*** Keywords ***
Open Web browser
    Set Selenium Speed          0.2s
    Open Browser                ${url}         ${browser}
    Wait Until Page Contains    Kru P' Beam    2s
    Maximize Browser Window

Input Data For Register
    Input Text                ${locator_firstname}    กนกนวล
    Input Text                ${locator_lastname}     อินขาน
    Input Text                ${locator_email}        Beam1234@gmail.com
    Input Text                ${locator_password}     1234567890
    Input Text                ${locator_phone}        08222222222
    Select Radio Button       ${locator_gender}       female         #คือค่าของ Value ไม่ใช่ wording
    Select Checkbox           ${locator_courseSQL}                 #checkbox จะให้ใส่ที่เลือกไปเลย จะไม่มีให้ใส่ค่าตัวแปร
    Select List Nationality
    Select List Role
    Select List Plan

#ทำเพิ่มขึ้นมาสำหรับแบบการใช้ Test Templete
Input Data Fail - Test Templete
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${password}    ${mobile}    ${gender}    ${chkbox}    ${nation}    ${role}    ${plan}    ${locator}    ${msg}
    Open Web browser
    Input Text                ${locator_firstname}     ${firstname}
    Input Text                ${locator_lastname}      ${lastname}
    Input Text                ${locator_email}         ${email}
    Input Text                ${locator_password}      ${password}
    Input Text                ${locator_phone}         ${mobile}
    Select Radio Button       ${locator_gender}        ${gender}
    IF    "${gender}" != "emp"   #ถ้าเป็นข้อความ ต้องใส่ " " ทั้งสองฝั่งด้วย
        Select Radio Button    ${locator_gender}    ${gender}
    END

    IF  ${chkbox} == 1
        Select Checkbox    ${locator_courseSQL}
    
    ELSE IF  ${chkbox} == 2
        Select Checkbox    ${locator_courseSQL}
        Select Checkbox    ${locator_courseTestManual}
    
    ELSE IF  ${chkbox} == 3
        Select Checkbox    ${locator_courseSQL}
        Select Checkbox    ${locator_courseTestManual}
        Select Checkbox    ${locator_courseAutomateTest}
    
    ELSE IF  ${chkbox} == 4
        Select Checkbox    ${locator_courseSQL}
        Select Checkbox    ${locator_courseTestManual}
        Select Checkbox    ${locator_courseAutomateTest}
        Select Checkbox    ${locator_courseAutomateTest2}
    END

    IF  ${nation} == 1
        Select List Nationality
    END

    IF  ${role} == 1
        Select List Role
    END

    IF  ${plan} == 1
        Select List Plan
    END

    Click Element      ${locator_btn_signup}
    Verify ErrorMsg    ${locator}    ${msg}
    Close Browser
    
Verify ErrorMsg
    [Arguments]    ${locator}    ${msg}=${EMPTY}
    ${txt}=    Get Text    ${locator}
    Should Be Equal As Strings    ${txt}    ${msg}


Select List Nationality
    Click Element                    ${locator_select-nationality}
    Wait Until Element Is Visible    ${locator_select-nationality_list}
    Click Element                    ${locator_select-nationality_list}

Select List Role
    Click Element                    ${locator_select-role}
    Wait Until Element Is Visible    ${locator_select-role_list}
    Click Element                    ${locator_select-role_list}

Select List Plan
    Click Element                    ${locator_select-plan}
    Wait Until Element Is Visible    ${locator_select-plan_list}
    Click Element                    ${locator_select-plan_list}

 ##-------------------------------------------------------------------------------------------------------   

# Input Firstname - Null
#     Wait Until Element Is Visible    ${locator_firstname}
#     Input Text                       ${locator_firstname}           ${EMPTY}
#     Click Element                    ${locator_btn_signup}
#     Wait Until Element Is Visible    ${locator_FirstnameErrorMsg} 
#     ${txt}=    Get Text              ${locator_FirstnameErrorMsg}
#     Should Be Equal As Strings       ${txt}                         This field is required

# Input Lastname - Null
#     Wait Until Element Is Visible    ${locator_lastname}
#     Input Text                       ${locator_lastname}            ${EMPTY}
#     Click Element                    ${locator_btn_signup}
#     Wait Until Element Is Visible    ${locator_LastnameErrorMsg} 
#     ${txt}=    Get Text              ${locator_LastnameErrorMsg}
#     Should Be Equal As Strings       ${txt}                         This field is required

# Input Email - Null
#     Wait Until Element Is Visible    ${locator_email}
#     Input Text                       ${locator_email}               ${EMPTY}
#     Click Element                    ${locator_btn_signup}
#     Wait Until Element Is Visible    ${locator_EmailErrorMsg} 
#     ${txt}=    Get Text              ${locator_EmailErrorMsg}
#     Should Be Equal As Strings       ${txt}                         This field is required

# Input Email - Invalid
#     Wait Until Element Is Visible    ${locator_email}
#     Input Text                       ${locator_email}               23123.com
#     Click Element                    ${locator_btn_signup}
#     Wait Until Element Is Visible    ${locator_EmailInvalidMsg} 
#     ${txt}=    Get Text              ${locator_EmailInvalidMsg}
#     Should Be Equal As Strings       ${txt}                         Invalid email address
    

# Input Password - Null
#     Wait Until Element Is Visible    ${locator_password}
#     Input Text                       ${locator_password}            ${EMPTY}
#     Click Element                    ${locator_btn_signup}
#     Wait Until Element Is Visible    ${locator_PasswordErrorMsg}
#     ${txt}=    Get Text              ${locator_PasswordErrorMsg}
#     Should Be Equal As Strings       ${txt}                         This field is required

# Input Phone - Null
#     Wait Until Element Is Visible    ${locator_phone}
#     Input Text                       ${locator_phone}               ${EMPTY}
#     Click Element                    ${locator_btn_signup}
#     Wait Until Element Is Visible    ${locator_PhoneErrorMsg} 
#     ${txt}=    Get Text              ${locator_PhoneErrorMsg}
#     Should Be Equal As Strings       ${txt}                         This field is required

# Input Gender - Null
#     Wait Until Element Is Visible    ${locator_gender_group}
#     Click Element                    ${locator_btn_signup}
#     Wait Until Element Is Visible    ${locator_GenderErrorMsg} 
#     ${txt}=    Get Text              ${locator_GenderErrorMsg}
#     Should Be Equal As Strings       ${txt}                         This field is required

# Input Course - Null
#     Wait Until Element Is Visible    ${locator_course}
#     Click Element                    ${locator_btn_signup}
#     Wait Until Element Is Visible    ${locator_CourseErrorMsg} 
#     ${txt}=    Get Text              ${locator_CourseErrorMsg}
#     Should Be Equal As Strings       ${txt}                         This field is required

# Input Nationality - Null
#     Wait Until Element Is Visible    ${locator_select-nationality}
#     Click Element                    ${locator_btn_signup}
#     Wait Until Element Is Visible    ${locator_NationalityErrorMsg} 
#     ${txt}=    Get Text              ${locator_NationalityErrorMsg}
#     Should Be Equal As Strings       ${txt}                         This field is required

# Input Role - Null
#     Wait Until Element Is Visible    ${locator_select-role}
#     Click Element                    ${locator_btn_signup}
#     Wait Until Element Is Visible    ${locator_RoleErrorMsg} 
#     ${txt}=    Get Text              ${locator_RoleErrorMsg}
#     Should Be Equal As Strings       ${txt}                         This field is required

# Input Plan - Null
#     Wait Until Element Is Visible    ${locator_select-plan}
#     Click Element                    ${locator_btn_signup}
#     Wait Until Element Is Visible    ${locator_PlanErrorMsg} 
#     ${txt}=    Get Text              ${locator_PlanErrorMsg}
#     Should Be Equal As Strings       ${txt}                         This field is required
