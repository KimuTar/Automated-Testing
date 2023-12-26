*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                            https://automate-test.stpb-digital.com/register/
${browser}                        chrome
${locator_firstname}              id=firstname
${locator_lastname}               id=lastname
${locator_email}                  id=email
${locator_password}               id=password
${locator_phone}                  id=mobile-phone
${locator_gender}                 validation-basic-radio    #ใส่แค่ชื่อของ GroupName
${locator_gender_group}           xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[6]
${locator_course}                 xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[7]
${locator_courseSQL}              name=courses.SQL
${locator_courseTestManual}       name=courses.Test Manual
${locator_courseAutomateTest}     name=courses.Automate Test
${locator_courseAutomateTest2}    name=courses.Automate Test2
${locator_select-nationality}     id=nationality
${locator_select-nationality_list}    xpath=//*[@id="menu-"]/div[3]/ul/li[221]    #สำหรับให้ List แสดงผล (Thai)
${locator_select-role}            id=select-role
${locator_select-role_list}       xpath=//*[@id="menu-"]/div[3]/ul/li[1]    #สำหรับให้ List แสดงผล (Admin)
${locator_select-plan}            id=select-plan
${locator_select-plan_list}       xpath=//*[@id="menu-"]/div[3]/ul/li[1]   #สำหรับให้ List แสดงผล (Basic)
${locator_btn_signup}             id=btn-sign-up
${locator_reset}                  id=reset
${locator_hyperlink_signin}       xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[11]/p[2]/a
${locator_btn-ok}                 id=btn-ok

${locator_FirstnameErrorMsg}      id=error-firstname
${locator_LastnameErrorMsg}       id=error-lastname
${locator_EmailErrorMsg}          id=error-email
${locator_EmailInvalidMsg}        xpath=//*[@id="error-email"]
${locator_PasswordErrorMsg}       id=error-password
${locator_PhoneErrorMsg}          id=error-mobile-phone
${locator_GenderErrorMsg}         id=validation-basic-gender
${locator_CourseErrorMsg}         id=validation-basic-courses
${locator_NationalityErrorMsg}    id=validation-basic-nationality
${locator_RoleErrorMsg}           id=validation-role
${locator_PlanErrorMsg}           id=validation-plan


*** Keywords ***
Open Web browser
    Set Selenium Speed          0.5s
    Open Browser                ${url}         ${browser}
    Wait Until Page Contains    Kru P' Beam    5s
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

Input Firstname - Null
    Wait Until Element Is Visible    ${locator_firstname}
    Input Text                       ${locator_firstname}           ${EMPTY}
    Click Element                    ${locator_btn_signup}
    Wait Until Element Is Visible    ${locator_FirstnameErrorMsg} 
    ${txt}=    Get Text              ${locator_FirstnameErrorMsg}
    Should Be Equal As Strings       ${txt}                         This field is required

Input Lastname - Null
    Wait Until Element Is Visible    ${locator_lastname}
    Input Text                       ${locator_lastname}            ${EMPTY}
    Click Element                    ${locator_btn_signup}
    Wait Until Element Is Visible    ${locator_LastnameErrorMsg} 
    ${txt}=    Get Text              ${locator_LastnameErrorMsg}
    Should Be Equal As Strings       ${txt}                         This field is required

Input Email - Null
    Wait Until Element Is Visible    ${locator_email}
    Input Text                       ${locator_email}               ${EMPTY}
    Click Element                    ${locator_btn_signup}
    Wait Until Element Is Visible    ${locator_EmailErrorMsg} 
    ${txt}=    Get Text              ${locator_EmailErrorMsg}
    Should Be Equal As Strings       ${txt}                         This field is required

Input Email - Invalid
    Wait Until Element Is Visible    ${locator_email}
    Input Text                       ${locator_email}               23123.com
    Click Element                    ${locator_btn_signup}
    Wait Until Element Is Visible    ${locator_EmailInvalidMsg} 
    ${txt}=    Get Text              ${locator_EmailInvalidMsg}
    Should Be Equal As Strings       ${txt}                         Invalid email address
    

Input Password - Null
    Wait Until Element Is Visible    ${locator_password}
    Input Text                       ${locator_password}            ${EMPTY}
    Click Element                    ${locator_btn_signup}
    Wait Until Element Is Visible    ${locator_PasswordErrorMsg}
    ${txt}=    Get Text              ${locator_PasswordErrorMsg}
    Should Be Equal As Strings       ${txt}                         This field is required

Input Phone - Null
    Wait Until Element Is Visible    ${locator_phone}
    Input Text                       ${locator_phone}               ${EMPTY}
    Click Element                    ${locator_btn_signup}
    Wait Until Element Is Visible    ${locator_PhoneErrorMsg} 
    ${txt}=    Get Text              ${locator_PhoneErrorMsg}
    Should Be Equal As Strings       ${txt}                         This field is required

Input Gender - Null
    Wait Until Element Is Visible    ${locator_gender_group}
    Click Element                    ${locator_btn_signup}
    Wait Until Element Is Visible    ${locator_GenderErrorMsg} 
    ${txt}=    Get Text              ${locator_GenderErrorMsg}
    Should Be Equal As Strings       ${txt}                         This field is required

Input Course - Null
    Wait Until Element Is Visible    ${locator_course}
    Click Element                    ${locator_btn_signup}
    Wait Until Element Is Visible    ${locator_CourseErrorMsg} 
    ${txt}=    Get Text              ${locator_CourseErrorMsg}
    Should Be Equal As Strings       ${txt}                         This field is required

Input Nationality - Null
    Wait Until Element Is Visible    ${locator_select-nationality}
    Click Element                    ${locator_btn_signup}
    Wait Until Element Is Visible    ${locator_NationalityErrorMsg} 
    ${txt}=    Get Text              ${locator_NationalityErrorMsg}
    Should Be Equal As Strings       ${txt}                         This field is required

Input Role - Null
    Wait Until Element Is Visible    ${locator_select-role}
    Click Element                    ${locator_btn_signup}
    Wait Until Element Is Visible    ${locator_RoleErrorMsg} 
    ${txt}=    Get Text              ${locator_RoleErrorMsg}
    Should Be Equal As Strings       ${txt}                         This field is required

Input Plan - Null
    Wait Until Element Is Visible    ${locator_select-plan}
    Click Element                    ${locator_btn_signup}
    Wait Until Element Is Visible    ${locator_PlanErrorMsg} 
    ${txt}=    Get Text              ${locator_PlanErrorMsg}
    Should Be Equal As Strings       ${txt}                         This field is required


*** Test Cases ***
TC001 - Input Data
    Open Web browser
    Input Data For Register
    Click Element                    ${locator_btn_signup}
    Wait Until Page Contains         Register Success    5s
    Click Element                    ${locator_btn-ok}
    Wait Until Page Contains         Welcome to Kru P' Beam    5s
    Close Browser

TC002-Reset Data
    Open Web browser
    Input Data For Register
    Click Element                    ${locator_reset}
    Close Browser

TC-003 - Hyperlink Sign in instead
    Open Web browser
    Click Element                    ${locator_hyperlink_signin}
    Close Browser

TC-004 - Null Required Field
    Open Web browser
    Input Firstname - Null
    Input Lastname - Null
    Input Email - Null
    Input Password - Null
    Input Phone - Null
    Input Gender - Null
    Input Course - Null
    Input Nationality - Null
    Input Role - Null
    Input Plan - Null
    Close Browser

TC-005 - Check box course
    Open Web browser
    Wait Until Page Contains    SQL    
    Select Checkbox      name=courses.SQL    #หรือใช้แบบ locator ก็ได้
    Unselect Checkbox    ${locator_courseSQL}
    Sleep    2s
    Select Checkbox      ${locator_courseTestManual}
    Unselect Checkbox    ${locator_courseTestManual}
    Sleep    2s
    Select Checkbox      ${locator_courseAutomateTest}
    Unselect Checkbox    ${locator_courseAutomateTest}
    Sleep    2s
    Select Checkbox      ${locator_courseAutomateTest2}
    Unselect Checkbox    ${locator_courseAutomateTest2}
    Sleep    2s
    Close Browser

TC-006 - Email invalid
      Open Web browser
      Input Email - Invalid
      Sleep    2s
      Close Browser