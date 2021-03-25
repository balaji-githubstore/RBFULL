*** Settings ***
Documentation    This file automates all the fields in the dashboard

Resource    ../Base/common_functionality.resource

*** Variables ***
${PROFILENAME_LOCATOR}    xpath=//span[@data-bind='text:fname']
${LOGOUT_LOCATOR}    xpath=//li[text()='Logout']



*** Keywords ***
Dashboard_Page_Should_Contain
    [Arguments]    ${expectedtext}
    Wait Until Page Contains Element    ${PROFILENAME_LOCATOR}    timeout=30s
    Page Should Contain    ${expectedtext}

Mouse_Over_Profile_Name
    Mouse Over    ${PROFILENAME_LOCATOR}
    
Click_LogOut
    Click Element    ${LOGOUT_LOCATOR} 
    
