*** Settings ***
Documentation    Тестирование сайта nexign.com в рамках самостоятельного проекта
Force Tags    nexign.com
Library    SeleniumLibrary
Resource    ../resources/nexign_main_ru.robot
Variables    ../resources/variables.py


*** Test Cases ***
Test correct function buttons
    [Documentation]    Проверка функциональности сайта в роли пользователя
    [Setup]    Open Browser and Maximize    ${url_main}    ${browser_chrome}
    Set Screenshot Directory    ./screenshots/fail
    Accept cookies
    Check Get in touch
    Change language
    Check search
    Check page-up block
    [Teardown]    Close Browser and Log

Test get in touch form
    [Documentation]    Сценарий отправки формы обратной связи в роли пользователя
    [Tags]    cookie    get-in-touch-form
    [Setup]    Open Browser and Maximize    ${url_main}    ${browser_chrome}
    Set Screenshot Directory    ./screenshots/fail
    Accept cookies
    Send get in touch form    ${first_name}    ${last_name}    ${company_name}    ${job_title}    ${business_email}    ${phone_number}    ${question}
    [Teardown]    Close Browser and Log

Test contains and accept cookies
    [Documentation]    Валидация куки
    [Tags]    cookie
    [Setup]    Open Browser and Maximize    ${url_main}    ${browser_chrome}
    Page contain cookies warn
    Accept cookies
    Page Should Not Contain Element    sliding-popup
    [Teardown]    Close Browser and Log

Check the subscribe form
    [Documentation]    Сценарий подписки на рассылку новостей в роли пользователя
    [Tags]    subscribe-form
    [Setup]    Open Browser and Maximize    ${url_media}    ${browser_chrome}
    Accept cookies
    Subscribed    ${name}    ${post}    ${company_name}    ${email}
    [Teardown]    Close Browser and Log