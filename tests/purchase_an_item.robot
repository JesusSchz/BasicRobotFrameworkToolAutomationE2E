*** Settings ***
Library     SeleniumLibrary
Resource    ../data/variables.resource
Resource    ../resources/auth/login.resource
Resource    ../resources/purchase_an_item/purchase_an_item.resource

*** Test Cases ***
Validate that the user can purchase an item
    Given The user is on Login Page
    When User login with username ${user} and password ${password}
    And User selects items from the dashboard list
    And User sunmits the order 
    Then The purchase is successfully completed