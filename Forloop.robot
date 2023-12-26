*** Settings ***
Library    SeleniumLibrary

*** Variables ***
@{num1}    1    2    3
@{num2}    หนึ่ง    สอง    สาม
@{num3}    one    two    three

*** Keywords ***

*** Test Cases ***
# Simple
#     FOR  ${i}  IN  one    two    three
#         Log To Console    ${i}
#         Log To Console    1
    
#     END

# Simple list
#     @{list}    Create List    1    2    3    4
#     FOR  ${i}  IN  @{list}
#         Log To Console    ${i}
#         Log To Console    1
    
#     END

# Three variable
#     FOR  ${a}    ${b}    ${c}  IN
#     ...      1       one      หนึ่ง
#     ...      2       two      สอง
#     ...      3       three    สาม  
#         Log To Console    ${a} | ${b} | ${c}
#     END

# List variable
#     @{list}    Create List    1    one    หนึ่ง    2    two    สอง    3    three    สาม
#     FOR  ${a}    ${b}    ${c}  IN  @{list}
#         Log To Console    ${a} | ${b} | ${c}
    
#     END

# Upper limit
#     FOR  ${i}  IN RANGE   5
#         Log To Console    ${i}
    
#     END

# start and end     #จะเริ่มแสดงค่าที่ 2-5 จะไม่แสดงค่าที่ 6
#     FOR  ${i}  IN RANGE    2    6
#         Log To Console    ${i}
    
#     END

# Also step given    #ค่าเริ่มที่ 5 บวกทีละ 10 แล้วค่าต้องไม่เกิน 26
#     FOR  ${i}  IN RANGE    5    26    10
#         Log To Console    ${i}
    
#     END

# For zip
#     FOR  ${a}    ${b}    ${c}  IN ZIP    ${num1}    ${num2}    ${num3}
#         Log Many    ${a}    ${b}    ${c}
    
#     END

# For zip variable
#     FOR  ${items}  IN ZIP    ${num1}    ${num2}    ${num3}
#         Length Should Be    ${items}    3
#         Log Many    ${items}[0]    ${items}[1]    ${items}{2}
    
#     END

# Exit loop
#     FOR    ${i}    IN    a    b    c
#         # Run Keyword If    '${i}' == 'c'    exit for loop
#         # Log To Console    ${i}
#         Exit For Loop If    '${i}'=='c'
#         Log To Console    ${i}
#     END

# Continous for loop
#     FOR  ${i}  IN RANGE    10
#         # Log To Console    ${i}
#         # Continue For Loop
#         # Log To Console    A

#         Log To Console    ${i}
#         Continue For Loop If    '${i}' < '10'
#         Log To Console    B
    
#     END


    

    
    
    
    
    
    
    
        