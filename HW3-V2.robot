*** Settings ***
Library           SeleniumLibrary
Resource          ${CURDIR}/HW3-VariableV2.robot
Resource          ${CURDIR}/HW3-KeywordV2.robot
Suite Setup       Set Selenium Speed               0.1s
Suite Teardown    Close All Browsers
Test Setup        Login Page
Test Teardown     Click Element    ${locator_btn-clear}


*** Test Cases ***
TC001 - Login Page
    [Documentation]    การ login เข้าสู่ระบบ
    [Tags]             Login
    [Setup]
    Login Page
    Close Browser
    [Teardown]

TC002 - Verify Search
    [Documentation]    การทดสอบ Function Search
    [Tags]             Search
    [Template]         Verify Search Filters
    ${locator_select-role-admin}         0                                       0
    ${locator_select-role-author}        ${locator_select-plan-basic}            0
    ${locator_select-role-maintainer}    0                                       ${locator_select-status-inactive}
    ${locator_select-role-editor}        ${locator_select-plan-team}             ${locator_select-status-active}
    0                                    ${locator_select-plan-company}          0
    0                                    ${locator_select-plan-enterprise}       ${locator_select-status-pending}
    0                                    0                                       ${locator_select-status-pending}
    [Teardown]

TC003 - Test Show Row Per Page
      [Documentation]    ทดสอบผลการแสดงผลจำนวนของข้อมูล ในการเลือกแสดงแบบ 25 ข้อมูล
      [Tags]             Row per page
      Verify Row Per page
      [Teardown]

TC004 - Test Next and Previous Page Data
    [Documentation]    ทดสอบการกดปุ่ม Next Page Data และ Previous
    [Tags]             Next and Previous Page Data
    Verify Next and Previous Page Data
    [Teardown]

TC005 - Click Button Add User
    [Documentation]    ทดสอบการกดปุ่ม Add User
    [Tags]             Add User
    Click Button Add User
    Click Element                    ${locator_btn-back}
    Close Browser
    [Teardown]

TC006 - Logout 
    [Documentation]    ทดสอบการกดปุ่ม Logout
    [Tags]             Logout
    Logout user
    [Teardown]

TC007 - Test Page Add User - Pass
    [Documentation]    ใช้สำหรับทดสอบการกรอกข้อมูลหน้า add user
    [Tags]    add user pass
    [Setup]
    Input Data Add User
    [Teardown]

TC008 - Test Page Add User - Fail
    [Documentation]    ใช้สำหรับทดสอบการกรอกข้อมูลหน้า add user fail
    [Tags]             add user fail
    [Setup]
    [Template]         Input Data Add User Page - Fail
    ${EMPTY}    อินขาน       Beam1234@gmail.com    1234567890    08000000000    female      1    1    1    1    ${locator_FirstnameErrorMsg}     This field is required
    กนกนวล      ${EMPTY}    Beam1234@gmail.com    1234567890    08000000000    female      1    1    1    1    ${locator_LastnameErrorMsg}      This field is required
    กนกนวล      อินขาล       ${EMPTY}              1234567890    08000000000    female      1    1    1    1    ${locator_EmailErrorMsg}         This field is required
    กนกนวล      อินขาล       Beam1234@gmail.com    ${EMPTY}      08000000000    female      1    1    1    1    ${locator_PasswordErrorMsg}      This field is required
    กนกนวล      อินขาล       Beam1234@gmail.com    1234567890    ${EMPTY}       female      1    1    1    1    ${locator_PhoneErrorMsg}         This field is required
    กนกนวล      อินขาล       Beam1234@gmail.com    1234567890    08000000000    0           1    1    1    1    ${locator_GenderErrorMsg}        This field is required
    กนกนวล      อินขาล       Beam1234@gmail.com    1234567890    08000000000    female      0    1    1    1    ${locator_CourseErrorMsg}        This field is required
    กนกนวล      อินขาล       Beam1234@gmail.com    1234567890    08000000000    female      1    0    1    1    ${locator_NationalityErrorMsg}   This field is required
    กนกนวล      อินขาล       Beam1234@gmail.com    1234567890    08000000000    female      1    1    0    1    ${locator_RoleErrorMsg}          This field is required
    กนกนวล      อินขาล       Beam1234@gmail.com    1234567890    08000000000    female      1    1    1    0    ${locator_PlanErrorMsg}          This field is required
    [Teardown]







    
#-------------------------------------------------- ไม่ได้ใช้แล้ว ---------------------------------------------------------------#

# TC002 - Test Search Role
#     [Documentation]    ทดสอบการค้นหา Role
#     [Tags]             Pass
#     Select List Role

# TC003 - Test Search Plan
#     [Documentation]    ทดสอบการค้นหา Plan
#     [Tags]             Pass
#     Select List Plan

# TC004 - Test Search Status
#     [Documentation]    ทดสอบการค้นหา Status 
#     [Tags]             Pass
#     Select List Status

# TC005 - Test Search Role and Plan
#     [Documentation]    ทดสอบการค้นหา Role และ Plan
#     [Tags]    Search Role and Plan
#     Select List Role-Plan

# TC006 - Test Search Role and Status
#     [Documentation]    ทดสอบการค้นหา Role และ Status
#     [Tags]    Search Role and Status
#     Select List Role-Status

# TC007 - Test Search Plan and Status
#     [Documentation]    ทดสอบการค้นหา Plan และ Status
#     [Tags]    Search Plan and Status
#     Select List Plan-Status

# TC008 - Test Search Role Plan Status
#     [Documentation]    ทดสอบผลการค้นหาจาก List role plan status
#     [Tags]             Pass
#     Select List Role-Plan-Status