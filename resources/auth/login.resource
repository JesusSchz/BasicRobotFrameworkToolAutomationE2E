*** Settings ***
Library   SeleniumLibrary
Resource     ../../data/variables.resource

*** Keywords ***
The user is on Login Page
    Open Browser                   ${url}    chrome
    Maximize Browser Window

User login with username ${username} and password ${password}
    Input Text                     id:userEmail                              ${username}
    Input Text                     id:userPassword                           ${password}
    Click Button                   id:login

User should see the welcome message
    Wait Until Element Is Visible  //button[contains(.,'Sign Out')]
    Page Should Contain Element    //div[contains(text(),' Login Successfully ')]
    Page Should Contain Button     //button[contains(.,'Sign Out')]

User should see the error message
    Wait Until Element Is Visible  //div[contains(text(),'Incorrect email or password.')]
    Page Should Contain Element    //div[contains(text(),'Incorrect email or password.')]