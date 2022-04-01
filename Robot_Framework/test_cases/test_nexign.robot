*** Settings ***
Documentation    Automation tests for an inderpendent task for Nexign Bootcamp
Library    SeleniumLibrary
Resource    ../resources/nexign_main_ru.robot
Variables    ../resources/variables.py


*** Test Cases ***
The correct function buttons
    [Setup]    Open Browser and Maximize    ${url_main}    ${browser_chrome}
    Set Screenshot Directory    ./screenshots/fail
    Accept cookies
    Check Get in touch
    Change language
    Check search
    Check page-up block
    [Teardown]    Close Browser and Log


Check the feedback form
    [Setup]    Open Browser and Maximize    ${url_main}    ${browser_chrome}
    Set Screenshot Directory    ./screenshots/fail
    Accept cookies
    Send get in touch form    ${first_name}    ${last_name}    ${company_name}    ${job_title}    ${business_email}    ${phone_number}
    [Teardown]    Close Browser and Log


Check the subscribe
    [Setup]    Open Browser and Maximize    ${url_media}    ${browser_chrome}
    Accept cookies
    Subscribed    ${name}    ${post}    ${company_name}    ${email}
    [Teardown]    Close Browser and Log