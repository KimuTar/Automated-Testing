*** Variables ***
${url}                  https://automate-test.stpb-digital.com/login/
${browser}              chrome
${locator_user}         id=email
${locator_password}     name=password
${locator_btn-login}    id=btn-login
${locator_role}         id=select-role
#Role
${locator_select-role}              id=select-role
${locator_select-role_list}         xpath=//*[@id="menu-"]/div[3]/ul/li[1]    #สำหรับให้ List แสดงผล
${locator_select-role-admin}        id=option-select-role-1
${locator_result-role-admin}        xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[3]/div/p
${locator_select-role-author}       id=option-select-role-2
${locator_result-role-author}       xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[3]/div/p
${locator_select-role-editor}       id=option-select-role-3
${locator_result-role-editor}       xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[3]/div/p
${locator_select-role-maintainer}   id=option-select-role-4
${locator_result-role-maintainer}   xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[3]/div/p
${locator_select-role-subscriber}   id=option-select-role-5
${locator_result-role-subscriber}   xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[3]/div/p
#Plan
${locator_select-plan}              id=select-plan
${locator_select-plan_list}         xpath=//*[@id="option-select-plan-0"]
${locator_select-plan-basic}        id=option-select-plan-1
${locator_result-plan-basic}        xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[4]/h6
${locator_select-plan-company}      id=option-select-plan-2
${locator_result-plan-company}      xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[4]/h6
${locator_select-plan-enterprise}   id=option-select-plan-3
${locator_result-plan-enterprise}   xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[4]/h6
${locator_select-plan-team}         id=option-select-plan-4
${locator_result-plan-team}         xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[4]/h6
#Status
${locator_select-status}            id=select-status
${locator_select-status_list}       xpath=//*[@id="option-select-status-0"]
${locator_select-status-pending}    id=option-select-status-1
${locator_result-status-pending}    xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[5]/div/span
${locator_select-status-active}     id=option-select-status-2
${locator_result-status-active}     xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[5]/div/span
${locator_select-status-inactive}   id=option-select-status-3
${locator_result-status-inactive}   xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]/div[2]/div[2]/div/div/div/div[1]/div[5]/div/span

${locator_showdata}                 xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[2]
${locator_btn-adduser}              xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[2]/div/div[1]/div/a
${locator_btn-search}               id=btn-search
${locator_btn-clear}                id=btn-clear
${locator_profile}                  xpath=//*[@id="__next"]/div[1]/div[2]/header/div/div/div[2]/span/div/img
${locator_logout}                   css=body > div.MuiModal-root.MuiPopover-root.MuiMenu-root.css-hxcdyb > div.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation1.MuiMenu-paper.MuiPaper-root.MuiPaper-elevation.MuiPaper-rounded.MuiPaper-elevation8.MuiPopover-paper.css-1u9pw9f > ul > li
${locator_btn-back}                 xpath=//*[@id="__next"]/div[1]/div[2]/main/div/div[1]/button

${locator_rowpage}                  xpath=//*[@id=":r2:"]
${locator_rowpagenumber}            xpath=//*[@id="menu-"]/div[3]/ul/li[2]


${locator_forwardpage}              css=#__next > div.layout-wrapper.css-uinsfl > div.layout-content-wrapper.MuiBox-root.css-34b9xr > main > div > div:nth-child(2) > div > div.MuiDataGrid-root.MuiDataGrid-autoHeight.css-rx2f15 > div:nth-child(3) > div > div.MuiTablePagination-root.css-u1jk8u > div > div.MuiTablePagination-actions > button:nth-child(2) > svg
${locator_backwardpage}             css=#__next > div.layout-wrapper.css-uinsfl > div.layout-content-wrapper.MuiBox-root.css-34b9xr > main > div > div:nth-child(2) > div > div.MuiDataGrid-root.MuiDataGrid-autoHeight.css-rx2f15 > div:nth-child(3) > div > div.MuiTablePagination-root.css-u1jk8u > div > div.MuiTablePagination-actions > button:nth-child(1) > svg
${locator_numofdata}                css=#__next > div.layout-wrapper.css-uinsfl > div.layout-content-wrapper.MuiBox-root.css-34b9xr > main > div > div:nth-child(2) > div > div.MuiDataGrid-root.MuiDataGrid-autoHeight.css-rx2f15 > div:nth-child(3) > div > div.MuiTablePagination-root.css-u1jk8u > div > p.MuiTablePagination-displayedRows.css-196rrgv

#------------------------ สำหรับหน้าการกรอกข้อมูล Add User Page ---------------------------------------
${locator_firstname-adduser}                  id=firstname
${locator_lastname-adduser}                   id=lastname
${locator_email-adduser}                      id=email
${locator_password-adduser}                   id=password
${locator_phone-adduser}                      id=mobile-phone
${locator_gender-adduser}                     validation-basic-radio                         #ใส่แค่ชื่อของ GroupName
${locator_gender_group-adduser}               xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[6]
${locator_course-adduser}                     xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/div/form/div[7]
${locator_courseSQL-adduser}                  name=courses.SQL
${locator_courseTestManual-adduser}           name=courses.Test Manual
${locator_courseAutomateTest-adduser}         name=courses.Automate Test
${locator_courseAutomateTest2-adduser}        name=courses.Automate Test2
${locator_select-nationality-adduser}         id=nationality
${locator_select-nationality_list-adduser}    xpath=//*[@id="menu-"]/div[3]/ul/li[221]    #สำหรับให้ List แสดงผล (Thai)
${locator_select-role-adduser}                id=select-role
${locator_select-role_list-adduser}           xpath=//*[@id="menu-"]/div[3]/ul/li[1]          #สำหรับให้ List แสดงผล (Admin)
${locator_select-plan-adduser}                id=select-plan
${locator_select-plan_list-adduser}           xpath=//*[@id="menu-"]/div[3]/ul/li[1]          #สำหรับให้ List แสดงผล (Basic)
${locator_btn_signup-adduser}                 css=#__next > div.layout-wrapper.css-uinsfl > div.layout-content-wrapper.MuiBox-root.css-34b9xr > main > div > div:nth-child(3) > div > div > div > form > button
${locator_reset-adduser}                      id=reset
${locator_btn-ok-adduser}                     id=btn-ok
${locator_FirstnameErrorMsg}          id=error-firstname
${locator_LastnameErrorMsg}           id=error-lastname
${locator_EmailErrorMsg}              id=error-email
${locator_EmailInvalidMsg}            xpath=//*[@id="error-email"]
${locator_PasswordErrorMsg}           id=error-password
${locator_PhoneErrorMsg}              id=error-mobile-phone
${locator_GenderErrorMsg}             id=validation-basic-gender
${locator_CourseErrorMsg}             id=validation-basic-courses
${locator_NationalityErrorMsg}        id=validation-basic-nationality
${locator_RoleErrorMsg}               id=validation-role
${locator_PlanErrorMsg}               id=validation-plan
