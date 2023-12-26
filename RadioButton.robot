*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***

*** Test Cases ***
TC-Facebook
    Open Browser    https://th-th.facebook.com/reg/    chrome
    Wait Until Element Is Visible    name=sex    5s
    Select Radio Button    sex    1
    Sleep    5s
    Close Browser

TC-Kru P'Beam Register
    Open Browser    https://automate-test.stpb-digital.com/register/    chrome
    Wait Until Page Contains    Gender
    Select Radio Button    validation-basic-radio    female
    Sleep    5s
    Close Browser

# TC-Ebay Register
#     Open Browser    https://signup.ebay.com/pa/crte?ru=https%3A%2F%2Fwww.ebay.com%2F    chrome
#     Wait Until Element Contains    Create an account
#     Select Radio Button    personalaccount-radio    personalaccount
#     Sleep    5s
#     Close Browser
