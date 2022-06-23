*** Settings ***
Documentation    Users can sign up on site by filling information
Resource         ../resources/keyword.resource
Test Setup      I Go To Login Page
Test Teardown   I Teardown
Test Template   I Signup by Fill Form
Default Tags    C001

*** Test Cases ***
Signup by Filling Every Fields                        True
Signup by Filling Every Fields Without MKT Consent    False