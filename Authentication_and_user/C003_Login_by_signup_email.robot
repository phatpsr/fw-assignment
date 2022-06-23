*** Settings ***
Documentation    Users can login using account signup with an email
Resource         ../resources/keyword.resource
Resource         ../resources/variable.resource
Test Teardown   I Teardown
Default Tags    C003

*** Keywords ***
I Signup By Email And Go To Login Page
    I Go To Login Page
    I Signup by Fill Form    False
    Click    //*[@data-selenium='user-menu-panel.link.sign-out']
    Eat All Cookies
    Close Context    ALL
    Close Page       ALL
    Close Browser    ALL
    I Open Browser & Go To Application
    New Page        ${APP_URL}
    Click    id=login-link

*** Test Cases ***
Login Using Account Signup With An Email
    [Setup]    I Signup By Email And Go To Login Page
    Fill Text    id=authorize-request-Credential    ${email}
    Click    //*[@id='authorize-request-form']/button
    Fill Text    id=signin-request-Password    12345678
    Click    //*[@id='signin-request-form']/button
    I Verify I Am Logging In
