*** Settings ***
Documentation     Ceci est un projet de test.
Library    SeleniumLibrary

*** Variables ***
${LOGIN_URL}  http://localhost:7272/
${BROWSER}  Chrome
${USERNAME}  demo
${PASSWORD}  mode
${DELAY}  0.5

*** Test Cases ***
Valid Login
   Open Browser To Login Page
   Input Username  demo
   Input Password  mode
   Submit Credentials
   Welcome Page Should Be Open
   [Teardown]    Close Browser

*** Keywords ***
Open Browser To Login Page
    Open Browser  ${LOGIN_URL}  ${BROWSER}
    Maximize Browser Window
    # Set Selenium Speed    ${DELAY}
    Wait Until Element Is Visible  id:username_field  timeout=5
    Title Should Be  Login Page

Input Username
     [Arguments]  ${USERNAME}
     Input Text  id:username_field  ${USERNAME}

Input Password
     [Arguments]  ${PASSWORD}
     Input Text  id:password_field  ${PASSWORD}

Submit Credentials
    Click Button  login_button

Welcome Page Should Be Open
    Title Should Be  Welcome Page





