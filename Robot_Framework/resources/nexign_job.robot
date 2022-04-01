*** Settings ***
Library    SeleniumLibrary


*** Keywords ***

Go to student page
    # Set Screenshot Directory    screenshots
    Click Element    xpath=/html/body/div/div[1]/div[2]/div/div/div[2]/a[2]
    Location Should Be    https://job.nexign.com/students

Go to school QA
    Page Should Contain Element    block-views-list-elements-block
    Click Link    /students/shkola-testirovshchikov
    Location Should Be    https://job.nexign.com/students/shkola-testirovshchikov

Send form to school QA
    [Arguments]    ${email_for_school}
    Scroll Element Into View    block-webform-client-block-356
    Input Text    edit-submitted-email--2    ${email_for_school}
    Wait Until Element Is Visible    xpath=//*[@id="edit-submitted-consent--5"]/div/label
    Select Checkbox    xpath=//*[@id="edit-submitted-consent--5-1"]
    Sleep    5
    Click Button    edit-submit--5


Send call
    Scroll Element Into View    bottom_form
