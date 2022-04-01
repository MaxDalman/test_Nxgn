*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/nexign_job.robot
Resource    ../resources/nexign_main_ru.robot
Variables    ../resources/variables.py


*** Test Cases ***
Test go to student page
    [Setup]    Open Browser and Maximize    ${url_job}    ${browser_name}
    Go to student page
    [Teardown]    Close Browser and Log

Test send form to school QA
    [Setup]    Open Browser and Maximize    ${url_job}    ${browser_name}
    Go to student page
    Go to school QA
    Send form to school QA    ${email_for_school}
    [Teardown]    Close Browser and Log

