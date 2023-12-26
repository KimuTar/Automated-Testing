*** Settings ***   
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***

*** Test Cases ***
# TC-Lazada
#     Open Browser    https://member.lazada.co.th/user/register?spm=a2o4m.home-th.header.d6.450b2a80hbh2De   chrome
    
#     Select Checkbox    id=enableSmsNewsletter
#     Sleep    5s
#     Close Browser

TC-Kru P'Beam Register
    Open Browser    https://automate-test.stpb-digital.com/register/    chrome
    Wait Until Page Contains    SQL    
    Select Checkbox    name=courses.SQL
    Sleep    5s
    Close Browser

TC-Ebay Signin
    Open Browser    https://signin.ebay.com/ws/eBayISAPI.dll?SignIn&UsingSSL=1&siteid=0&co_partnerId=2&pageType=2556586&ru=https://www.ebay.com/&regUrl=https%3A%2F%2Fsignup.ebay.com%2Fpa%2Fcrte%3Fru%3Dhttps%253A%252F%252Fwww.ebay.com%252F    chrome
    Wait Until Page Contains    Stay signed in    5s
    Select Checkbox    id=kmsi-checkbox
    Sleep    5s
    Close Browser

TC-Thaiairway
    Open Browser