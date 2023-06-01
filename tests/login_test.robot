*** Settings ***
Library   SeleniumLibrary
Resource    ../resources/auth/login.resource
Resource    ../data/variables.resource

*** Test Cases ***
Validate a valid user can log in
    Given The user is on Login Page
    When User login with username ${user} and password ${password}
    Then User should see the welcome message
    
Validate error when not valid user try to log in
    Given The user is on Login Page
    When User login with username ${user} and password ${invalidPass}
    Then User should see the error message
