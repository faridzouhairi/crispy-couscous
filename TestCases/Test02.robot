*** Settings ***
Library    SeleniumLibrary
Documentation    Ce cas de test permet de reserver une demo gratuite sur le site OranDemo.
...    (handle window, switch to window)
Test Setup    Ouvrir site dans le le navigateur
Test Teardown    Close Browser

*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${BROWSER}    chrome


*** Test Cases ***
Reserver une demo gratuite
    Cliquer sur le lien orangeHRM.com
    Switcher vers une autre fenetre
    Reserver sur une demo gratuite
    


*** Keywords ***
Ouvrir site dans le le navigateur
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Sleep    2s
Cliquer sur le lien orangeHRM.com
    Click Link    xpath://div/div[1]/div/div[1]/div/div[2]/div[3]/div[2]/p[2]/a
    Sleep    2s
Switcher vers une autre fenetre
    @{ListWindows}=    Get Window Handles
    Log To Console    @{ListWindows}    
    Switch Window    ${ListWindows}[1]
    Sleep    2s
Reserver sur une demo gratuite
    Click Button    xpath://*[@id="navbarSupportedContent"]/div[2]/ul/li[1]/a/button
    Input Text    xpath://div[3]/div/div/section[2]/div/div[2]/div/div/div/form/fieldset/div[1]/div/input//div[1]    farid
    Input Text    name:Email    farid@gmail.com
    Input Text    css:#Form_getForm_Contact    514432223
    Click Element    id:Form_getForm_action_submitForm
    