*** Settings ***
Library    SeleniumLibrary
Resource    ${CURDIR}/TestEbay-Variable.robot

*** Keywords ***
Open Ebay Browser
    Open Browser    ${url}    ${browser}
    Maximize Browser Window
    Wait Until Element Is Visible    ${locator_search}

Verify Input Search Data - Press Key
    Wait Until Element Is Visible    ${locator_search}
    Input Text    ${locator_search}    iphone
    Select Cate
    Press Keys    ${locator_search}    ENTER

Verify Input Search Data - Click Button
    Wait Until Element Is Visible    ${locator_search}
    Input Text    ${locator_search}    iphone
    Select Cate
    Click Element    ${locator_btn-search}

Select Cate
    Wait Until Element Is Visible    ${locator_select-cat}
    Click Element    ${locator_select-cat}
    Select From List By Value    ${locator_select-cat}    58058

Select Product
    Wait Until Element Is Visible    ${locator_nameproduct}
    Click Element    ${locator_nameproduct}
    Wait Until Element Is Visible    For Apple MacBook Logo Decal For Iphone 13 Logo Iphone 14 Logo PVC Sticker

Select Product2
    Wait Until Element Is Visible    ${locator_nameproduct}
    Click Element    ${locator_nameproduct}
    Wait Until Element Is Visible    SD Card Reader for iPhone iPad, 4 in 1 Micro SD/SD Card Reader to iPhone Adapter

Verify Result Data    
    [Arguments]    ${locator}
    Wait Until Element Is Visible    ${locator_resultNumber}
    ${num}=    Get Text    ${locator}
    IF  ${num} > 0
        Log To Console    pass
    END

Verify Input Search Data - Press Key Templete
    [Arguments]    ${txt}
    Open Ebay Browser
    Wait Until Element Is Visible    ${locator_search}
    Input Text    ${locator_search}    ${txt}
    Select Cate
    Press Keys    ${locator_search}    ENTER
    Close Browser