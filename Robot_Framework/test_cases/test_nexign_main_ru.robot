*** Settings ***
Library    SeleniumLibrary
Resource    ../resources/nexign_main_ru.robot
Variables    ../resources/variables.py

*** Test Cases ***
Test_get_in_touch
    [Setup]    Open Browser and Maximize    ${url_main}    ${browser_chrome}
    Accept cookies
    Send get in touch form    ${first_name}    ${last_name}    ${company_name}    ${job_title}    ${business_email}    ${phone_number}
    [Teardown]    Close Browser and Log

Test_contains_and_accept_cookies
    [Setup]    Open Browser and Maximize    ${url_main}    ${browser_chrome}
    Page contain cookies warn
    Accept cookies
    Page Should Not Contain Element    sliding-popup
    [Teardown]    Close Browser and Log


