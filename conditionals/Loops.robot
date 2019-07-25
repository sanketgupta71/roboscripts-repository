*** Settings ***
Library  String

*** Variables ***

*** Test Cases ***
For Loop with Upper Bounds Range
    [Documentation]  This gives us a 0 based range
    [Tags]  tag1
    :FOR  ${Index}  IN RANGE  5
    \  Do Something  ${Index}
    \  ${RANDOM_STRING} =  Generate Random String  ${Index}
    \  Log  ${RANDOM_STRING}

For Loop with Upper And Lower Bounds Range
    [Documentation]  This gives non zero based range
    [Tags]  tag2
    :FOR  ${Index}  IN RANGE  1  5
    \  Do Something  ${Index}
    \  ${RANDOM_STRING} =  Generate Random String  ${Index}
    \  Log  ${RANDOM_STRING}

For Loop with Upper And Lower Bounds Range With Intervals
    [Documentation]  This gives a range with Intervals
    [Tags]  tag3
    :FOR  ${Index}  IN RANGE  0  10  2
    \  Do Something  ${Index}
    \  ${RANDOM_STRING} =  Generate Random String  ${Index}
    \  Log  ${RANDOM_STRING}

For Loop With List
    [Documentation]  For loop with list
    [Tags]  tag4
    @{ITEMS} =  Create List  Item 1  Item 2  Item 3
    :FOR  ${MyItem}  IN  @{ITEMS}
    \  Log  ${MyItem}

Exit a FOR Loop
    [Documentation]  For Loop exit test case
    [Tags]  tag5
    @{ITEMS} =  Create List  Item 1  Item 2  Item 3  Item 4

    :FOR  ${MyItem}  IN  @{ITEMS}
    \  Log  ${MyItem}
    \  Run Keyword If  "${MyItem}" == "Item 3"  exit for loop
    \  Log  Didn't exit yet
    Log  Now we are out of the loop

Repeat a Keyword many times
    [Tags]  tag6
    repeat keyword  5  A Repeatable Keyword
    repeat keyword  2 times  A Repeatable Keyword
    repeat keyword  3 s  A Repeatable Keyword

Print Odd Numbers
    [Documentation]  For loop with list and display only odd numbers
    [Tags]  tag7
    @{ITEMS} =  Create List  1  2  3  4  5  6  7  8  9  10
    :FOR  ${MyItem}  IN  @{ITEMS}
    \    ${result} =  evaluate  ${MyItem} % 2
    \    Run Keyword If  ${result} == 1  Keyword 1   ${MyItem}

*** Keywords ***
Do Something
    [Arguments]  ${PassedIndex}
    Log  I was passed a value of ${PassedIndex}

A Repeatable Keyword
    Log  I am being repeated

Keyword 1
    [Arguments]  ${MyItem}
    Log  ${MyItem}