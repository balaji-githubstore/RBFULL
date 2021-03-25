*** Settings ***
Documentation    This file will take of browser activities

Library    OperatingSystem    
Library    SeleniumLibrary    screenshot_root_directory=screenshot/            

*** Variables ***
${BROWSER}    chrome
${URL}    https://demo.openemr.io/b/openemr/interface/login/login.php?site=default


*** Keywords ***
Launch_Browser    
    Append To Environment Variable    PATH      ${EXECDIR}${/}driver 
    Open Browser   browser=${BROWSER}
    Maximize Browser Window   
    Go To    url=${URL}
    Set Selenium Implicit Wait    30s
    Set Selenium Timeout    50s
    

End_Browser 
    Close All Browsers
    