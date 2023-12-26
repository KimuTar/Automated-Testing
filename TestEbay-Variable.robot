*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${url}                        https://www.ebay.com/
${browser}                    chrome
${locator_search}             id=gh-ac
${locator_btn-search}         id=gh-btn
${locator_select-cat}         id=gh-cat
${locator_resultNumber}    xpath=//*[@id="mainContent"]/div[1]/div[2]/div[1]/div[1]/div[1]/h1/span[1]
${locator_nameproduct}    xpath=//*[@id="mainContent"]/div/div[1]/h1/span
${locator_checkboxBrand}    xpath=//*[@id="x-refine__group_1__0"]/ul/li[2]/div/a
${locator_resultProductName}    xpath=//*[@id="mainContent"]/div/div[12]/div/div[1]/div/div/div/div[1]/div/div/span
${locator_checkboxCondition}    xpath=//*[@id="x-refine__group__2"]/ul/li[1]/div/a/div/span/input
${locator_checkboxPrice}    xpath=//*[@id="s0-53-16-0-1-2-2-8[3]"]/li[1]/div/a/div/span/input
