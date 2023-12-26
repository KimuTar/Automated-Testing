*** Settings ***
Library     SeleniumLibrary
Resource    ${CURDIR}/HW3-VariableV2.robot

*** Keywords ***
Open Web Browser
    Open Browser                     ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${locator_user}

Login Page
    Open Web Browser
    Input Text       ${locator_user}        user.test@krupbeam.com
    Input Text       ${locator_password}    123456789
    Click Element    ${locator_btn-login}
    Wait Until Page Contains                Search Filters

Click Button Add User
    Click Element                    ${locator_btn-adduser}
    Wait Until Page Contains         Kru P' Beam
    Sleep    0.2s

Logout user
    Click Element                    ${locator_profile}
    Sleep    0.2s
    
    Click Element                    ${locator_logout}
    Wait Until Page Contains         Welcome to Kru P' Beam!
    Close Browser

Verify Row Per page
    Click Element                    ${locator_btn-search}
    Wait Until Element Is Visible    ${locator_showdata}
    Sleep    1s
    Click Element                    ${locator_rowpage}
    Sleep    1s
    Click Element                    ${locator_rowpagenumber}
    Sleep    1s
    ${txt}=    Get Text    ${locator_numofdata}
    Should Be Equal As Strings    ${txt}    1–25 of 53

Verify Next and Previous Page Data
    Click Element                    ${locator_btn-search}
    Wait Until Element Is Visible    ${locator_showdata}
    Sleep    1s
    Click Element                    ${locator_forwardpage}
    ${txt}=    Get Text              ${locator_numofdata}
    Should Be Equal As Strings       ${txt}                    11–20 of 53
    Sleep    1s
    Click Element                    ${locator_backwardpage}
    ${txt2}=    Get Text             ${locator_numofdata}
    Should Be Equal As Strings       ${txt2}                   1–10 of 53

Verify Search Filters
    [Arguments]    ${role}    ${plan}    ${status}  
    IF  '${role}' != '0'
        Click Element                    ${locator_select-role}
        Wait Until Element Is Visible    ${locator_select-role_list}
        Click Element                    ${role} 
    END
    
    IF  "${plan}" != "0"
        Click Element                    ${locator_select-plan}
        Wait Until Element Is Visible    ${locator_select-plan_list}
        Click Element                    ${plan}  
    END

    IF  "${status}" != "0"
        Click Element                    ${locator_select-status}
        Wait Until Element Is Visible    ${locator_select-status_list}
        Click Element                    ${status}  
    END
    Click Element                        ${locator_btn-search}
    Wait Until Element Is Visible        ${locator_showdata}
    Click Button                         ${locator_btn-clear}

#---------------------------------- หน้าการกรอกข้อมูล Add User Page ---------------------------------------#
Select List Nationality-adduser
    Click Element                    ${locator_select-nationality-adduser}
    Wait Until Element Is Visible    ${locator_select-nationality_list-adduser}
    Click Element                    ${locator_select-nationality_list-adduser}

Select List Role-adduser
    Click Element                    ${locator_select-role-adduser}
    Wait Until Element Is Visible    ${locator_select-role_list-adduser}
    Click Element                    ${locator_select-role_list-adduser}

Select List Plan-adduser
    Click Element                    ${locator_select-plan-adduser}
    Wait Until Element Is Visible    ${locator_select-plan_list-adduser}
    Click Element                    ${locator_select-plan_list-adduser}

Input Data Add User
    Login Page
    Click Button Add User
    Wait Until Page Contains    Kru P' Beam    0.3s
    Input Text                ${locator_firstname-adduser}    abcd
    Input Text                ${locator_lastname-adduser}     ertggsac
    Input Text                ${locator_email-adduser}        1234@gmail.com
    Input Text                ${locator_password-adduser}     1234567890
    Input Text                ${locator_phone-adduser}        08222222222
    Select Radio Button       ${locator_gender-adduser}       male         #คือค่าของ Value ไม่ใช่ wording
    Select Checkbox           ${locator_courseSQL-adduser}                 #checkbox จะให้ใส่ที่เลือกไปเลย จะไม่มีให้ใส่ค่าตัวแปร
    Select List Nationality-adduser
    Select List Role-adduser
    Select List Plan-adduser
    Click Element                    ${locator_btn_signup-adduser}
    Wait Until Page Contains         Register Success    2s
    Click Element                    ${locator_btn-ok-adduser}
    Wait Until Page Contains         Search Filters    2s
    Close Browser

Input Data Add User Page - Fail
    Login Page
    Click Button Add User
    Wait Until Page Contains    Kru P' Beam    0.1s
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${password}    ${mobile}    ${gender}    ${chkbox}    ${nation}    ${role}    ${plan}    ${locator}    ${msg}
    Input Text                ${locator_firstname-adduser}     ${firstname}
    Input Text                ${locator_lastname-adduser}      ${lastname}
    Input Text                ${locator_email-adduser}         ${email}
    Input Text                ${locator_password-adduser}      ${password}
    Input Text                ${locator_phone-adduser}         ${mobile}
    IF    "${gender}" != "0"   
        Select Radio Button   ${locator_gender-adduser}        ${gender}
    END
    IF  ${chkbox} == 1
        Select Checkbox       ${locator_courseSQL-adduser}
    
    ELSE IF  ${chkbox} == 2
        Select Checkbox       ${locator_courseSQL-adduser}
        Select Checkbox       ${locator_courseTestManual-adduser}
    
    ELSE IF  ${chkbox} == 3
        Select Checkbox       ${locator_courseSQL-adduser}
        Select Checkbox       ${locator_courseTestManual-adduser}
        Select Checkbox       ${locator_courseAutomateTest-adduser}
    
    ELSE IF  ${chkbox} == 4
        Select Checkbox       ${locator_courseSQL-adduser}
        Select Checkbox       ${locator_courseTestManual-adduser}
        Select Checkbox       ${locator_courseAutomateTest-adduser}
        Select Checkbox       ${locator_courseAutomateTest2-adduser}
    END

    IF  ${nation} == 1
        Select List Nationality-adduser
    END

    IF  ${role} == 1
        Select List Role-adduser
    END

    IF  ${plan} == 1
        Select List Plan-adduser
    END
    Click Element              ${locator_btn_signup-adduser}
    Verify ErrorMsg            ${locator}             ${msg}
    Close Browser

Verify ErrorMsg
    [Arguments]    ${locator}    ${msg}=${EMPTY}
    ${txt}=    Get Text    ${locator}
    Should Be Equal As Strings    ${txt}    ${msg}

#---------------------------------------------------- ไม่ได้ใช้แล้ว ----------------------------------------------------#

# Select List Role
#     @{listRole}    Create List        ${locator_select-role-admin}         ${locator_result-role-admin}    
#     ...                               ${locator_select-role-author}        ${locator_result-role-author}    
#     ...                               ${locator_select-role-editor}        ${locator_result-role-editor}    
#     ...                               ${locator_select-role-maintainer}    ${locator_result-role-maintainer}    
#     ...                               ${locator_select-role-subscriber}    ${locator_result-role-subscriber}
#      FOR            ${select-role}    ${result-role}  IN  @{listRole}
#      Click Element                    ${locator_select-role}
#      Wait Until Element Is Visible    ${locator_select-role_list}
#      Click Element                    ${select-role}
#      Click Element                    ${locator_btn-search}
#      Wait Until Element Is Visible    ${result-role}
#      Sleep    1s
#      Click Element                    ${locator_btn-clear}    
#      END

# Select List Plan
#     @{listPlan}    Create List        ${locator_select-plan-basic}         ${locator_result-plan-basic}
#     ...                               ${locator_select-plan-company}       ${locator_result-plan-company}    
#     ...                               ${locator_select-plan-enterprise}    ${locator_result-plan-enterprise}    
#     ...                               ${locator_select-plan-team}          ${locator_result-plan-team}    
#      FOR            ${select-plan}    ${result-plan}  IN  @{listPlan}
#      Click Element                    ${locator_select-plan}
#      Wait Until Element Is Visible    ${locator_select-plan_list}
#      Click Element                    ${select-plan}
#      Click Element                    ${locator_btn-search}
#      Wait Until Element Is Visible    ${result-plan}
#      Sleep    1s
#      Click Element                    ${locator_btn-clear}    
#      END
    
# Select List Status
#     @{listStatus}    Create List      ${locator_select-status-pending}     ${locator_result-status-pending}
#     ...                               ${locator_select-status-active}      ${locator_result-status-active}
#     ...                               ${locator_select-status-inactive}    ${locator_result-status-inactive}
#     FOR           ${select-status}    ${result-status}  IN  @{listStatus}
#     Click Element                     ${locator_select-status}
#     Wait Until Element Is Visible     ${locator_select-status_list}
#     Click Element                     ${select-status}
#     Click Element                     ${locator_btn-search}
#     Wait Until Element Is Visible     ${result-status}
#     Sleep    1s
#     Click Element                     ${locator_btn-clear}
#     END

# Select List Role-Plan
#     @{listRolePlan}    Create List        ${locator_select-role-admin}         ${locator_select-plan-basic}                
#     ...                                   ${locator_select-role-author}        ${locator_select-plan-company}          
#     ...                                   ${locator_select-role-editor}        ${locator_select-plan-enterprise}       
#     ...                                   ${locator_select-role-maintainer}    ${locator_select-plan-team}
#     ...                                   ${locator_select-role-subscriber}    ${locator_select-plan-team}         
#      FOR                                  ${select-role}                       ${select-plan}                    IN  @{listRolePlan}
#      Click Element                    ${locator_select-role}
#      Wait Until Element Is Visible    ${locator_select-role_list}
#      Click Element                    ${select-role}
     
#      Click Element                    ${locator_select-plan}
#      Wait Until Element Is Visible    ${locator_select-plan_list}
#      Click Element                    ${select-plan}

#      Click Element                    ${locator_btn-search}
#      Wait Until Element Is Visible    ${locator_showdata}
#      Sleep    1s
#      Click Element                    ${locator_btn-clear}    
#      END

# Select List Role-Status
#     @{listRoleStatus}    Create List      ${locator_select-role-admin}         ${locator_select-status-active}        
#     ...                                   ${locator_select-role-author}        ${locator_select-status-inactive}    
#     ...                                   ${locator_select-role-editor}        ${locator_select-status-pending}    
#     ...                                   ${locator_select-role-maintainer}    ${locator_select-status-active}
#     ...                                   ${locator_select-role-subscriber}    ${locator_select-status-inactive}
#      FOR                                  ${select-role}                       ${select-status}                  IN  @{listRoleStatus}
#      Click Element                    ${locator_select-role}
#      Wait Until Element Is Visible    ${locator_select-role_list}
#      Click Element                    ${select-role}

#      Click Element                    ${locator_select-status}
#      Wait Until Element Is Visible    ${locator_select-status_list}
#      Click Element                    ${select-status}

#      Click Element                    ${locator_btn-search}
#      Wait Until Element Is Visible    ${locator_showdata}
#      Sleep    1s
#      Click Element                    ${locator_btn-clear}    
#      END

# Select List Plan-Status
#     @{listPlanStatus}    Create List  ${locator_select-plan-basic}        ${locator_select-status-active}        
#     ...                               ${locator_select-plan-company}      ${locator_select-status-inactive}    
#     ...                               ${locator_select-plan-enterprise}   ${locator_select-status-pending}    
#     ...                               ${locator_select-plan-team}         ${locator_select-status-active}
#     ...                               ${locator_select-plan-team}         ${locator_select-status-inactive}
#      FOR                              ${select-plan}                      ${select-status}                       IN  @{listPlanStatus}
#      Click Element                    ${locator_select-plan}
#      Wait Until Element Is Visible    ${locator_select-plan_list}
#      Click Element                    ${select-plan}

#      Click Element                    ${locator_select-status}
#      Wait Until Element Is Visible    ${locator_select-status_list}
#      Click Element                    ${select-status}

#      Click Element                    ${locator_btn-search}
#      Wait Until Element Is Visible    ${locator_showdata}
#      Sleep    1s
#      Click Element                    ${locator_btn-clear}    
#      END

# Select List Role-Plan-Status
#     @{listRolePlanStatus}    Create List  ${locator_select-role-admin}         ${locator_select-plan-basic}        ${locator_select-status-active}        
#     ...                                   ${locator_select-role-author}        ${locator_select-plan-company}      ${locator_select-status-inactive}    
#     ...                                   ${locator_select-role-editor}        ${locator_select-plan-enterprise}   ${locator_select-status-pending}    
#     ...                                   ${locator_select-role-maintainer}    ${locator_select-plan-team}         ${locator_select-status-active}
#     ...                                   ${locator_select-role-subscriber}    ${locator_select-plan-team}         ${locator_select-status-inactive}
#      FOR                                  ${select-role}                       ${select-plan}                      ${select-status}                       IN  @{listRolePlanStatus}
#      Click Element                    ${locator_select-role}
#      Wait Until Element Is Visible    ${locator_select-role_list}
#      Click Element                    ${select-role}
     
#      Click Element                    ${locator_select-plan}
#      Wait Until Element Is Visible    ${locator_select-plan_list}
#      Click Element                    ${select-plan}

#      Click Element                    ${locator_select-status}
#      Wait Until Element Is Visible    ${locator_select-status_list}
#      Click Element                    ${select-status}

#      Click Element                    ${locator_btn-search}
#      Wait Until Element Is Visible    ${locator_showdata}
#      Sleep    1s
#      Click Element                    ${locator_btn-clear}    
#      END





  

 




 