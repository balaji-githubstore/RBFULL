*** Settings ***
Documentation    This file validates the positive credentials
...    on the open emr demo application
 
Resource    ../Resource/Base/common_functionality.resource
Resource    ../Resource/Pages/LoginPage.resource
Resource    ../Resource/Pages/DashboardPage.resource

Test Setup    Launch_Browser
Test Teardown    End_Browser

Test Template    Valid_Credential_Template

*** Test Cases ***
TC1    admin    pass    English (Indian)    Flow Board
TC2    physician    physician    English (Indian)    Flow Board
TC3    accountant    accountant    English (Indian)    Flow Board
    
*** Keywords ***
Valid_Credential_Template   
    [Arguments]    ${username}    ${password}    ${language}    ${expectedvalue} 
    Enter_Username    ${username}
    Enter_Password    ${password}   
    Select_Language_Using_Label      ${language}          
    Click_Login   
    Dashboard_Page_Should_Contain    ${expectedvalue}   
    Mouse_Over_Profile_Name
    Click_LogOut  
    