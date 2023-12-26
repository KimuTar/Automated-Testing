*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${url}                   https://automate-test.stpb-digital.com/login
${browser}               chrome
${locator_InputEmail}    id=email
${locator_btn-login}     id=btn-login
${locator_EmailErrorMsg}    xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[1]/p
${locator_InputPassword}    name=password
${locator_PasswordErrorMsg}    xpath=//*[@id="__next"]/div[1]/div/div/div/div/div/form/div[2]/p

*** Keywords ***
Open Web Browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Page Contains    Welcome to Kru P' Beam!

Input Email
    [Arguments]    ${input}
    Wait Until Element Is Visible    ${locator_InputEmail}
    Input Text    ${locator_InputEmail}    ${input}
    Press Keys    ${locator_InputEmail}    ENTER

Input Password
    [Arguments]    ${inputpassword}
    Wait Until Element Is Visible    ${locator_InputPassword}
    Input Text    ${locator_InputPassword}    123
    Press Keys    ${locator_InputPassword}    ENTER

Input EmailPass
    [Arguments]    ${inputemail}    ${inputpassword}
    Wait Until Element Is Visible    ${locator_InputEmail}
    Wait Until Element Is Visible    ${locator_InputPassword}
    Input Text    ${locator_InputEmail}    ${inputemail}
    Input Text    ${locator_InputPassword}    ${inputpassword}
    Click Element    ${locator_btn-login}


Verify ErrorMsg Email
    Wait Until Element Is Visible    ${locator_EmailErrorMsg}
    ${txt}    Get Text    ${locator_EmailErrorMsg}
    Should Be Equal As Strings    ${txt}    email must be a valid email

Verify ErrorMsg Password
    Wait Until Element Is Visible    ${locator_PasswordErrorMsg}
    ${txt2}    Get Text    ${locator_PasswordErrorMsg}
    Should Be Equal As Strings    ${txt2}    password must be at least 5 characters

*** Test Cases ***
# Verify Input Email Fail
#     @{list}    Create List    aaaaa    0123213    หแฟหแฟ                    #สร้างตัวแปรสำหรับการทดสอบแบบ loop
#     FOR  ${i}  IN  @{list}
    
#     Open Web Browser
#     Input Email    ${i}
#     Verify ErrorMsg Email
#     Close Browser
#     END

Verify Input EmailPassword
    Set Selenium Speed    0.5s
    @{list2}    Create List    000000000    123    llllllaaaaa    ววว    นนนนนนน    vvV
    FOR  ${email}    ${password}  IN  @{list2}
        Open Web Browser
        Input EmailPass    ${email}    ${password}
        Verify ErrorMsg Email
        Verify ErrorMsg Password
        Close Browser
    
    END
    