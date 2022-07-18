*** Settings ***
Documentation     Ceci est un projet de test pour une page Login
Library    SeleniumLibrary
Resource   Resources/resource.robot

*** Test Cases ***
#Valid Login
#   Open Browser To Login Page
#   Input Username  demo
#   Input Password  mode
#   Submit Credentials
#   Welcome Page Should Be Open
#   [Teardown]    Close Browser
#
## BDD
#Valid Login
#    Given Une Page Login est Ouverte
#    When  Un Username Et Un Password doivent Etre Inserres
#    and credentials are submitted
#    Then welcome page should be open
#    [Teardown]    Close Browser

Test Ana
    Given La Page DAcceuil De Ana
    When Tous Les Champs Sont Remplies
