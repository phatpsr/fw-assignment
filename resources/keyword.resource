*** Settings ***
Documentation    Reuseable keywords
Library          Browser
Library          DateTime
Library          String
Resource         ./variable.resource

*** Keywords ***
I Open Browser & Go To Application
    New Browser                 chromium              headless=${HEADLESS}
    Set Browser Timeout         10s
    New Context

I Generate Email
    [Arguments]                 ${name}
    I Generate Unique number
    ${change_btn} =             Set Variable    //button//span[contains(text(),'change')]
    ${get_it_btn} =             Set Variable    //button[contains(text(),'Get it!')]
    ${cookie_warning_close} =   Set Variable    //*[@class='cookie-warning active']//*[@class="cookie-warning__close"]
    ${new_email_was_set} =      Set Variable    //*[@class='email__alert success']
    &{EMAIL_PAGE} =             New Page         https://temp-mail.io/en/
    Set Global Variable         ${EMAIL_PAGE}
    Wait Until Network Is Idle
    Click                       ${changeBtn}
    Fill Text                   id=name    ${name}
    Run Keyword And Ignore Error      Click    ${cookie_warning_close}
    Click                       ${get_it_btn}
    Wait For Elements State     ${new_email_was_set}    visible
    Wait Until Network Is Idle
    ${email} =                  Get Attribute    id=email    title
    Set Suite Variable          ${email}
    [Return]                    ${email}

I Get Verification Code From Email
    Switch Page    ${EMAIL_PAGE.page_id}
    ${refresh_btn} =             Set Variable    //button//span[contains(text(),'refresh')]
    ${empty_email} =             Set Variable    //div[@class='email-empty']
    ${email_is_empty} =          Set Variable    True
    WHILE    ${email_is_empty} is True
        Click    ${refresh_btn}
        Sleep    3s
        ${email_is_empty} =    Get Element States    ${empty_email}    then    bool(value & visible)
    END
    ${email_title} =             Get Text        //*[@class='email-list']//div[@class='message__body']/span
    @{verification_code} =       Get Regexp Matches    ${email_title}    (?<=\\*).+?(?=\\*)
    Switch Page                  ${APP_PAGE.page_id}
    [Return]    ${verification_code}[0]

I Generate Unique Number
    ${unique_no} =              Get Current Date       time_zone=local   result_format=%y%m%d%H%M%S
    Set Suite Variable    ${unique_no}
    [Return]    ${unique_no}

I Teardown
    Close Page    CURRENT
    Eat All Cookies

I Go To Login Page
    [Arguments]    ${gen_email}=True
    ${unique_no} =    I Generate Unique Number
    Run Keyword If    ${gen_email}==True    I Generate Email    uatfw${unique_no}
    &{APP_PAGE} =               New Page        ${APP_URL}
    Set Global Variable         &{APP_PAGE}
    Click    id=login-link
    
I Verify I Am Logging In    
    [Arguments]    ${verify_email}=${email}
    Wait For Navigation    ${APP_URL}    timeout=20s
    Click    //*[@class='user-button']
    Get Text    //div[@class='panel-user-menu']//small    ==    ${verify_email}
    Eat All Cookies

I Signup by Fill Form
    [Arguments]    ${mkt}
    ${submit_form_btn} =    Set Variable    //*[@id="signup-request-form"]/button
    ${verify_form_btn} =    Set Variable    //*[@id="verify-account-request-form"]/button
    Click    //*[@id='authorize-request-form']/following::a
    Wait For Elements State    id=signup-request-form    attached
    Fill Text    id=signup-request-username     robottester${unique_no}
    Fill Text    id=signup-request-first_name   Robot
    Fill Text    id=signup-request-last_name    Tester
    Fill Text    id=signup-request-email        ${email}
    Fill Text    id=signup-request-password    12345678
    Fill Text    id=signup-request-confirm_password    12345678
    Fill Text    id=signup-request-phone_number    ${unique_no}
    Check Checkbox    id=post-TCConsent    True
    Check Checkbox    id=post-PPConsent    True
    Check Checkbox    id=post-MKTConsent    ${mkt}
    Click        ${submit_form_btn}
    ${verification_code} =    I Get Verification Code From Email
    Fill Text    id=verify-account-request-verification_code    ${verification_code}
    Click    ${verify_form_btn}
    I Verify I Am Logging In

I Signup by Google Account
    [Arguments]    ${mkt}=True
    Click    //a[@href='/auth/google']
    Fill Text    id=identifierId    uatfw.testtest@gmail.com
    Click    id=identifierNext
    Fill Text    //*[@id="password"]//input    A12345678!
    Click    //*[@id="passwordNext"]//button
    Check Checkbox    id=post-TCConsent    True
    Check Checkbox    id=post-PPConsent    True
    Check Checkbox    id=post-MKTConsent    ${mkt}
    Click        //*[@id="verify-account-request-form"]/button

I Signup New Google Account
    ${unique_no}=    I Generate Unique Number
    Fill Text    firstName    Robot
    Fill Text    lastName    Tester
    Fill Text    username    uatfw.robot${unique_no}
    Fill Text    //*[@id="passwd"]//input    A12345678!
    Fill Text    //*[@id="confirm-passwd"]//input    A12345678!
    Click    id=accountDetailsNext
    # Google is required phone verification so we cannot use automate test here :(
