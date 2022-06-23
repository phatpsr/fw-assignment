*** Settings ***
Documentation    Users can sign up via google-account
...              Google sometime required phone verification
...              So, we cannot use automated test for this case
Resource         ../resources/keyword.resource
Test Setup      I Go To Login Page    False
Test Teardown   I Teardown
Default Tags    C002    skip

*** Test Cases ***
Signup Fastwork With Old Gmail
    I Signup by Google Account
    I Verify I Am Logging In

Signup Fastwork With New Gmail
    I Signup New Google Account
    I Verify I Am Logging In