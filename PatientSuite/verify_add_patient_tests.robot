*** Settings ***
Documentation    This file will add the patient and verifies the added record

Resource    ../Resource/Base/common_functionality.resource

Test Setup    Launch_Browser
Test Teardown    End_Browser
Resource    ../Resource/Pages/LoginPage.resource

Test Template    Verify_Add_Patient_Template

Library    DataDriver    file=../testdata/OpenEMRData.xlsx    sheet_name=Verify_Add_Patient_Template 

*** Test Cases ***
Verify_Add_Patient_Test_${username}

*** Keywords ***
Verify_Add_Patient_Template
    [Arguments]    ${username}    ${password}    ${language}    ${firstname}    ${lastname}    ${dob}    ${gender}    ${expectedalerttext}    ${expectedvalue}            
    Enter_Username    ${username}
    Enter_Password    ${password}   
    Select_Language_Using_Label      ${language}          
    Click_Login
    
    #DashboardPage
    Mouse Over    xpath=//div[text()='Patient/Client']
    Click Element    xpath=//div[text()='Patients']
    
    #PatientFinderPage
    Select Frame    xpath=//iframe[@name='fin']
    Click Element    id=create_patient_btn1   
    Unselect Frame
    
    #SearchOrAddPatientPage    
    Select Frame    xpath=//iframe[@name='pat']
    Input Text    id=form_fname    ${firstname}  
    Input Text    id=form_lname    ${lastname} 
    Input Text    id=form_DOB    ${dob}
    Select From List By Label    id=form_sex    ${gender}
    Click Element    id=create
    Unselect Frame
    Set Selenium Speed    1s
    Select Frame    //iframe[@id='modalframe']
    Click Element    //input[@value='Confirm Create New Patient']
    Unselect Frame   
    
                     
    ${message}    Handle Alert    timeout=30s
    Should Contain    ${message}    ${expectedalerttext}  
    
    Run Keyword And Ignore Error  Click Element    //div[@class='closeDlgIframe']
    Select Frame    pat
    Element Should Contain    //h2[contains(text(),'Medical Record Dashboard')]    ${expectedvalue}    
    
