*** Settings ***
Library     SeleniumLibrary
Resource    ${CURDIR}/Keyword-saucedemo.robot

*** Test Cases ***
Verify Login Pass
    Open Web Browser
    Input User and Password
    Close Browser