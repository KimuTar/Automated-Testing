*** Settings ***
Library           SeleniumLibrary
Resource          ${CURDIR}/Workshop3-Variable.robot
Resource          ${CURDIR}/Workshop3-Keyword.robot
Suite Setup       Set Selenium Speed    0.2s
Suite Teardown    Close All Browsers
Test Setup        Open Web browser
Test Teardown     Close Browser


*** Test Cases ***
# TC001 - Input Data
#     [Documentation]    ใช้สำหรับทดสอบในกรณีกรอกข้อมูลครบถ้วน
#     [Tags]    Test Pass
#     Input Data For Register
#     Click Element                    ${locator_btn_signup}
#     Wait Until Page Contains         Register Success    5s
#     Click Element                    ${locator_btn-ok}
#     Wait Until Page Contains         Welcome to Kru P' Beam    5s
    

# TC002-Reset Data
#     [Documentation]    ใช้สำหรับทดสอบในกรณี Clear ข้อมูล
#     [Tags]    Test Fail
    
#     Input Data For Register
#     Click Element                    ${locator_reset}
    

# TC-003 - Hyperlink Sign in instead
    
#     Click Element                    ${locator_hyperlink_signin}
    
#เพิ่มเข้ามาใหม่ เพื่อทดสอบกับ Workshop3
TC - Verify Case Fail
    [Documentation]    ใช้สำหรับทดสอบในกรณีกรอกข้อมูลไม่ครบถ้วน
    [Tags]    Test Fail
    [Setup]
    [Template]    Input Data Fail - Test Templete
    ${EMPTY}    อินขาน       Beam1234@gmail.com    1234567890    08000000000    female      1    1    1    1    ${locator_FirstnameErrorMsg}     This field is required
    กนกนวล      ${EMPTY}    Beam1234@gmail.com    1234567890    08000000000    female      1    1    1    1    ${locator_LastnameErrorMsg}      This field is required
    # กนกนวล      อินขาล       ${EMPTY}              1234567890    08000000000    female      1    1    1    1    ${locator_EmailErrorMsg}         This field is required
    # กนกนวล      อินขาล       Beam1234@gmail.com    ${EMPTY}      08000000000    female      1    1    1    1    ${locator_PasswordErrorMsg}      This field is required
    # กนกนวล      อินขาล       Beam1234@gmail.com    1234567890    ${EMPTY}       female      1    1    1    1    ${locator_PhoneErrorMsg}         This field is required
    # กนกนวล      อินขาล       Beam1234@gmail.com    1234567890    08000000000    0           1    1    1    1    ${locator_GenderErrorMsg}        This field is required
    # กนกนวล      อินขาล       Beam1234@gmail.com    1234567890    08000000000    female      0    1    1    1    ${locator_CourseErrorMsg}        This field is required
    # กนกนวล      อินขาล       Beam1234@gmail.com    1234567890    08000000000    female      1    0    1    1    ${locator_NationalityErrorMsg}   This field is required
    # กนกนวล      อินขาล       Beam1234@gmail.com    1234567890    08000000000    female      1    1    0    1    ${locator_RoleErrorMsg}          This field is required
    # กนกนวล      อินขาล       Beam1234@gmail.com    1234567890    08000000000    female      1    1    1    0    ${locator_PlanErrorMsg}          This field is required
    [Teardown]
    
# TC-006 - Email invalid
      
#       Input Email - Invalid
#       Sleep    2s

# TC-004 - Null Required Field
    
#     Input Firstname - Null
#     Input Lastname - Null
#     Input Email - Null
#     Input Password - Null
#     Input Phone - Null
#     Input Gender - Null
#     Input Course - Null
#     Input Nationality - Null
#     Input Role - Null
#     Input Plan - Null
    

# TC-005 - Check box course
    
#     Wait Until Page Contains    SQL    
#     Select Checkbox      name=courses.SQL    #หรือใช้แบบ locator ก็ได้
#     Unselect Checkbox    ${locator_courseSQL}
#     Sleep    2s
#     Select Checkbox      ${locator_courseTestManual}
#     Unselect Checkbox    ${locator_courseTestManual}
#     Sleep    2s
#     Select Checkbox      ${locator_courseAutomateTest}
#     Unselect Checkbox    ${locator_courseAutomateTest}
#     Sleep    2s
#     Select Checkbox      ${locator_courseAutomateTest2}
#     Unselect Checkbox    ${locator_courseAutomateTest2}
#     Sleep    2s
    


     