*** Settings ***
Library   SeleniumLibrary
Resource     ../../data/variables.resource

*** Variables ***
${userItems}         2
${elementsAmount}    ${EMPTY}

*** Keywords ***
User selects items from the dashboard list
    Wait Until Element Is Visible           //button[contains(.,'Sign Out')]
    Wait Until Element Is Visible           //button[contains(text(),'Add To Cart')]
    @{elementsList} =     Get WebElements   //button[contains(text(),'Add To Cart')]
    FOR    ${element}    IN    @{elementsList}
        Wait Until Element Is Not Visible   //ngx-spinner/div
        Run Keyword And Ignore Error    Wait Until Element Is Visible       /button[contains(.,'Sign Out')]
        Run Keyword And Ignore Error    Click Element    ${element}
    END
    Sleep    2s
    Click Button                            //li/button[contains(text(),' Cart')]
    Wait Until Element Is Visible           xpath://li/button[contains(text(),'Checkout')]
    Run Keyword And Ignore Error    Scroll Element Into View    xpath://li/button[contains(text(),'Checkout')]
    Click Element                           xpath://li/button[contains(text(),'Checkout')]
    Input Text                              css:.form__cc div:nth-of-type(2) > .input    159  
    Input Text                              css:.form__cc > div:nth-of-type(3) .input      Test Test
    Input Text                              css:[placeholder='Select Country']             Tunisia
    Wait Until Element Is Visible           xpath://span[contains(.,'Tunisia')]
    Click Element                           xpath://span[contains(.,'Tunisia')]
    

User sunmits the order
    Click Element                           xpath://a[contains(text(),'Place Order ')]

The purchase is successfully completed
    Wait Until Element Is Visible           xpath://h1[contains(text(),'Thankyou for the order.')]
    Element Should Be Visible               xpath://h1[contains(text(),'Thankyou for the order.')]