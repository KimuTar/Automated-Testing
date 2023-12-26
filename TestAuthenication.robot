*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}            https://the-internet.herokuapp.com/basic_auth
${browser}        chrome
${user}           admin
${password}       admin

*** Keywords ***
Open Authentication
    Set Selenium Speed    2s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window

Send Data
    Set Selenium Speed    2s
    Go To    https://${user}:${password}@the-internet.herokuapp.com/basic_auth
    Wait Until Page Contains    Congratulation
    Sleep    3s
    Close Browser

*** Test Cases ***
Verify Authentication
    Open Authentication
    Send Data