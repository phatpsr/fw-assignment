*** Settings ***
Documentation     Users can login using account signup with the google-account
...               Sometime Google is required multi-factor authentication
...               So, we cannot use automated test here
Resource         ../resources/keyword.resource
Resource         ../resources/variable.resource
Test Teardown   I Teardown
Default Tags    C004

*** Test Cases ***
Login Using Signup Google Account
    I Go To Login Page    False
    Click    //a[@href='/auth/google']
    Fill Text    id=identifierId    uatfw.testtest@gmail.com
    Click    id=identifierNext
    Fill Text    //*[@id="password"]//input    A12345678!
    Click    //*[@id="passwordNext"]//button
    I Verify I Am Logging In    uatfw.testtest@gmail.com
