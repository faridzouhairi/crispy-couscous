*** Settings ***
Library    SeleniumLibrary
Documentation    Cette suite pour expliquer le mecanisme d'attente statique et dynamique.
...    (Sleep, explicite wait, implicite wait)
Test Setup    Ouvrir site dans le le navigateur
Test Teardown    Close Browser

*** Variables ***
${URL}    https://demowebshop.tricentis.com/register
${BROWSER}    chrome
${vGender}    F

*** Test Cases ***
Test synchronisation
    When Selectionner un Gender    ${vGender}
    And Saisir first name 
    And Saisir last name  
    And Saisir email
    And Saisir password
    And Confrim password
    And Click enregistrer
    Then Valider que le message de confirmation d'enregistrement est affiche
    And Log out


*** Keywords ***
Ouvrir site dans le le navigateur
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
Selectionner un Gender
    [Arguments]    ${Genre}
    Select Radio Button    Gender   ${Genre}
Saisir first name
    Clear Element Text    id:FirstName
    Input Text    id:FirstName    farid2
Saisir last name 
    Clear Element Text    id:LastName
    Input Text    id:LastName    Zouhairi3
Saisir email
    Clear Element Text    id:Email
    Input Text    id:Email    zouhairi.farid111@gmail.com
Saisir password
    Clear Element Text    id:Password 
    Input Password    id:Password    123456
Confrim password
    Clear Element Text    id:ConfirmPassword 
    Input Password    id:ConfirmPassword    123456
Click enregistrer
    Click Element    id:register-button    
Valider que le message de confirmation d'enregistrement est affiche
    Page Should Contain    Your registration completed
Log out
    Click Element    xpath://div[4]/div[1]/div[1]/div[2]/div[1]/ul/li[2]/a