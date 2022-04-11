*** Settings ***
Library    SeleniumLibrary
Variables    ../resources/variables.py

*** Keywords ***
Open Browser and Maximize
    [Arguments]    ${test_url}    ${test_browser}
    Open Browser    ${test_url}    ${test_browser}
    Maximize Browser Window
    Log    Staring test in ${test_browser}
    Log    Test URL: ${test_url}

Close Browser and Log
    Close Browser
    Log    Finished test.

Page contain cookies warn
    Page Should Contain Element    class=cookie-warning__text_main
    Page Should Contain Element    class=cookie-warning__text
    Page Should Contain Link    /sites/default/files/privacy-policy/privacy_policy.pdf

Accept cookies
    Wait Until Element Is Enabled    sliding-popup
    Page Should Contain Element    sliding-popup
    Sleep    1
    Click Button    xpath=//button[@class="agree-button eu-cookie-compliance-secondary-button"]
    Wait Until Page Does Not Contain Element    sliding-popup

Send get in touch form
    [Arguments]    ${first_name}    ${last_name}    ${company_name}    ${job_title}    ${business_email}    ${phone_number}    ${question}
    Scroll Element Into View    class=main-form
    Input Text    edit-name    ${first_name}
    Input Text    edit-last-name    ${last_name}
    Input Text    edit-company-name    ${company_name}
    Input Text    edit-post    ${job_title}
    Input Text    edit-e-mail    ${business_email}
    Input Text    edit-phone-number    ${phone_number}
    Input Text    name=question    ${question}
    Checkbox Should Not Be Selected    edit-consent
    #Click Element    xpath=/html/body/div[1]/div/main/div[7]/div/div/div/div/form/div[10]/input
    #Checkbox Should Be Selected    edit-consent
    Click Element    xpath=/html/body/div[1]/div/main/div[7]/div/div/div/div/form/div[11]/label
    Click Button   edit-actions-submit
    Log    Request has been sent

Check Get in touch
    Click Element    class=get-in-touch__button
    Page Should Contain Element    xpath=/html/body/div[1]/div/div[4]
    Click Element    class=get-in-touch__popup-close
    Page Should Contain Element    xpath=//div[@style='display: none;']


Change language
    Scroll Element Into View    class=header__language
    Click Element    class=language__curent
    Page Should Contain Element    xpath=//div[@class='language language_white language_top language_select language_opened']
    Click Element    xpath=//a[@class='language-link language__option']


Check search
    Scroll Element Into View    class=header__search
    Click Element    class=header__search
    Page Should Contain Element    class=custom-search
    Input Text    id=edit-search-api-fulltext    Nexign
    Click Element    id=edit-submit-search
    Page Should Contain Element    class=custom-search__output
    Click Element    class=custom-search__close


Check page-up block
    Scroll Element Into View    class=footer
    Click Element    class=page-up-block
    Page Should Contain Element    class=header  header_white


Subscribed
    [Arguments]    ${name}    ${post}    ${company_name}    ${email}
    Scroll Element Into View    id=webform-submission-get-our-newsletter-node-17-add-form
    Input Text    name=name    ${name}
    Input Text    name=company_name    ${company_name}
    Select From List By Value    xpath=//*[@id="edit-country"]    Австрия
    Input Text    name=post    ${post}
    Input Text    name=e_mail    ${email}
    Click Element    xpath=//*[@id="webform-submission-get-our-newsletter-node-17-add-form"]/div[6]
    Click Element    name=op
    Wait Until Element Is Visible    class=webform-confirmation
    Page Should Contain Element    class=webform-confirmation