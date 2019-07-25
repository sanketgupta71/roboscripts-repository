*** Variables ***
${MY_VALUE}

*** Test Cases ***
Test Regular Expression
    Validate Input String  ${MY_VALUE}


*** Keywords ***
Validate Input String
    [Arguments]  ${input}
    should match regexp  ${input}  (a|c)*b((b(a|c)*b)*(a|c)*)*
