*** Settings ***
Documentation    This page handles all the element on the login page

Resource    ../Base/common_functionality.resource

*** Variables ***
${USERNAME_LOCATOR}    xpath=//input[@id='authUser']
${PASSWORD_LOCATOR}    id=clearPass
${LANGUAGE_LOCATOR}    name=languageChoice
${LOGIN_LOCATOR}    xpath=//button[@type='submit']
${ERROR_LOCATOR}    //*[contains(text(),'Invalid')]

*** Keywords ***
Enter_Username
    [Arguments]    ${username}
    Input Text    ${USERNAME_LOCATOR}    ${username} 
    
Enter_Password
    [Arguments]    ${password}
    Input Password    ${PASSWORD_LOCATOR}    ${password} 
    
Select_Language_Using_Label
    [Arguments]    ${language}
    Select From List By Label   ${LANGUAGE_LOCATOR}    ${language}
    
Click_Login
    Click Element    ${LOGIN_LOCATOR} 
    
Validate_Error_Message
    [Arguments]    ${expectedvalue}
    Element Should Contain     ${ERROR_LOCATOR}   ${expectedvalue} 


    