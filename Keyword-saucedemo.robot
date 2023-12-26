*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/Variable-saucedemo.robot

*** Keywords ***
Open Web Browser
    Set Selenium Speed    0.2s
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${locator_user}

Input User and Password
    Wait Until Element Is Visible    ${locator_user}
    Wait Until Element Is Visible    ${locator_password}
    Input Text    ${locator_user}    standard_user
    Input Text    ${locator_password}    secret_sauce
    Click Element    ${locator_btn-login}
    Wait Until Page Contains    Products