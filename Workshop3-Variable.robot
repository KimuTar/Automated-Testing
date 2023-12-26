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