*** Test Cases ***
Basic
    ${a}    Set Variable    ${5}
    ${b}    Set Variable    pass
    IF  ${a} == 10
        Log To Console    ${a}
        
    END

    #10 11 12
    IF  ${a} >= 10 and ${a} <= 12
        Log To Console    ${a}
        
    END

    #10 11
    IF  ${a} >= 10 and ${a} <=12 and ${a} != 12
        Log To Console    ${a}
        
    END

    #1 2 3 9 10 11 12 13
    IF  ${a} >= 9 or ${a} <= 3
        Log To Console    ${a}test
        
    END

    IF  ${a} >= 10
        Log To Console    Pass
    ELSE
        Log To Console    Fail
    END
    
    #10 11 12 13
    IF  ${a} > 10
        Log To Console    Fail
        
    END

    IF  ${a} < 10
        Log To Console    Pass
        
    END

    IF  '${b}' == 'pass'
        Log To Console    ${b}paSS
        
    END
    
    
    
    


    
    