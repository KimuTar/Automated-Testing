*** Settings ***
Library            SeleniumLibrary
Resource    ${CURDIR}/TestEbay-Variable.robot
Resource    ${CURDIR}/TestEbay-Keyword.robot
Suite Setup        Set Selenium Speed    0.2s
Test Setup         Open Ebay Browser
Test Teardown      Close Browser
Suite Teardown     Close All Browsers
Default Tags       Pass


*** Test Cases ***
Verify Input Text - Press Key
    [Tags]    Pass
    Verify Input Search Data - Press Key
    

Verify Input Text - Click Button
    
    Verify Input Search Data - Click Button
    

Verify Result Data
    
    Verify Input Search Data - Press Key
    Wait Until Page Contains    ${locator_resultNumber}
    Verify Result Data    ${locator_resultNumber}
    
Verify Result - Checkbox Brand
    
    Verify Input Search Data - Click Button
    Wait Until Element Is Visible    ${locator_resultNumber}
    Set Focus To Element    ${locator_checkboxBrand}
    Click Element    ${locator_checkboxBrand}
    Wait Until Element Is Visible    ${locator_resultNumber}
    Verify Result Data    ${locator_resultNumber}
    
    
Verify Result - Checkbox Condition
    [Tags]    error
    Verify Input Search Data - Press Key
    Wait Until Element Is Visible    ${locator_resultNumber}
    Set Focus To Element    ${locator_checkboxCondition}
    Click Element        ${locator_checkboxCondition}
    Wait Until Element Is Visible    ${locator_resultNumber}
    # ${num}=    Get Text    ${locator_resultNumber}
    # IF  ${num} > 0
    #     Log To Console    pass
    # END
    Verify Result Data    ${locator_resultNumber}
    

Verify Result - Checkbox Price
    
    Verify Input Search Data - Click Button
    Wait Until Element Is Visible    ${locator_resultNumber}
    Set Focus To Element    ${locator_checkboxPrice}
    Click Element    ${locator_checkboxPrice}
    # ${num}=    Get Text    ${locator_resultNumber}
    # IF  ${num} > 0
    #     Log To Console    pass
    # END
    Verify Result Data    ${locator_resultNumber}
    
Verify Result Data to Keyword 
    [Documentation]    ตรวจสอบการกรอกหลายข้อมูล
    [Setup]
    [Tags]    temp
    [Template]    Verify Input Search Data - Press Key Templete
    iphone
    huawei
    samsung
    oppo
    [Teardown]