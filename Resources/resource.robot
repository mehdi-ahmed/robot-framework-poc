*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported SeleniumLibrary.
Library           SeleniumLibrary

*** Variables ***
${SERVER}  ana-qa.apps.cfzcea.dev.desjardins.com
${BROWSER}  Chrome
${VALID USER}     demo
${VALID PASSWORD}    mode
${DELAY}  0.5
${LOGIN URL}      https://${SERVER}/
${WELCOME URL}    http://${SERVER}/welcome.html
${ERROR URL}      http://${SERVER}/error.html


${ANA 1}     TEST
${ANA 2}     TEST2
${ANA 3}     TEST3
*** Keywords ***
Open Browser To Login Page
    Open Browser  ${LOGIN_URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Wait Until Element Is Visible  id:username_field  timeout=5
    Title Should Be  Login Page

Input Username
     [Arguments]  ${USERNAME}
     Input Text  id:username_field  ${USERNAME}

Input Password
     [Arguments]  ${PASSWORD}
     Input Text  id:password_field  ${PASSWORD}

Welcome Page Should Be Open
    Location Should Be    ${WELCOME URL}
    Title Should Be  Welcome Page

Login Page Should Be Open
    Title Should Be    Login Page

Go To Login Page
    Go To    ${LOGIN URL}
    Login Page Should Be Open

Submit Credentials
    Click Button  login_button

Login Should Have Failed
    Location Should Be  ${ERROR URL}
    Title Should Be  Error Page

Login With Invalid Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Input Username    ${username}
    Input Password    ${password}
    Submit Credentials
    Login Should Have Failed

# BDD

Une Page Login est Ouverte
    Open Browser  ${LOGIN_URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Wait Until Element Is Visible  id:username_field  timeout=5
    Title Should Be  Login Page

Un Username Et Un Password doivent Etre Inserres
     Input Text  id:username_field  ${VALID USER}
     Input Text  id:password_field  ${VALID PASSWORD}

credentials are submitted
    Submit Credentials


La Page DAcceuil De Ana
    Open Browser  ${LOGIN_URL}  ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Wait Until Element Is Visible  name:nom  timeout=5
    Title Should Be  Accesdc Notifications Onboarding Spa Angular

Tous Les Champs Sont Remplies
     Input Text  name:description  ${ANA 2}
