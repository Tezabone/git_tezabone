*** Settings ***
Library  SeleniumLibrary
Library    DataDriver    logintest.xlsx  dialect=excel  sheet_name=Shopeepass
#Library    DataDriver    logintest.xlsx  dialect=excel  sheet_name=Shopeefail
Test setup      Open to shopping
Suite Teardown       Close all browsers

#Test Template       Input wrong user
Test Template       Input correct user

*** Test Cases ***
Testshopee01


*** Variables ***
${URL}      https://shopee.co.th/
#@{data}     shopee.test2021@gmail.com           Shopeebot21


*** Keywords ***
Open to shopping
    OPEN BROWSER    ${URL}      chrome
    Maximize Browser Window
    #เลือกภาษา
    Click Button    Xpath=//*[@id="modal"]/div[1]/div[1]/div/div[3]/div[2]/button
    Sleep       2
    #ปิด popup
    Click Element    Xpath=//*[@id="modal"]/div/div/div[2]/div
    Sleep       2

Click to login
    #คลิกปุ่ม signin
    Click Element    Xpath=//*[@id="main"]/div/div[2]/div[1]/div/div[1]/div/ul/a[3]
    Sleep       3

Input username
    [Arguments]     ${username}
    Input Text    Xpath=//*[@id="main"]/div/div[2]/div/div/form/div/div[2]/div[2]/div[1]/input    ${username}
    
Input password
    [Arguments]     ${pw}
    Input Text    Xpath=//*[@id="main"]/div/div[2]/div/div/form/div/div[2]/div[3]/div[1]/input    ${pw}
    

Input correct user
    Click to login
    [Arguments]     ${username}     ${pw}
    Input username      ${username}
    Input password      ${pw}
    Sleep       2
    Click login botton
    Buy something
    User enable to buy
#    Click signout botton

Input wrong user
    Click to login
    [Arguments]     ${username}     ${pw}
    Input username      ${username}
    Input password      ${pw}
    Sleep       2
    Click login botton
    Sleep       5
    User cannot sigin

Click login botton
    Click Element    Xpath=//*[@id="main"]/div/div[2]/div/div/form/div/div[2]/button
    Sleep       2

Buy something
    Input Text    Xpath=//*[@id="main"]/div/div[2]/div[1]/div/div[2]/div/div[1]/div[1]/div/form/input    unilever_householdcare
    Press Keys    Xpath=//*[@id="main"]/div/div[2]/div[1]/div/div[2]/div/div[1]/div[1]/div/form/input       ENTER
    Sleep    2
    Click Element    Xpath=//*[@id="main"]/div/div[2]/div[1]/div/div[2]/div/div[1]/div[1]/button
    Sleep    2
    Click Element    Xpath=//*[@id="main"]/div/div[2]/div[3]/div[2]/div/div[2]/div[1]/a/div/div/div[1]/img
    Sleep    2
    Click Element    Xpath=//*[@id="main"]/div/div[2]/div[2]/div[2]/div[2]/div[3]/div/div[5]/div/div/button[2]
    Sleep    2

#Click signout botton
#    Click Element       Xpath=//*[@id="main"]/div/div[2]/div[1]/div/div/div/ul/li[2]/div/div/div/div[2]
#    Sleep       2
#    Click Element       Xpath=//*[@id="main"]/div/div[2]/div[1]/div/div[1]/div/ul/li[2]/div/div


User enable to buy
    Page Should Contain    Shopping Cart

User cannot sigin
    Page Should Contain     Your account and/or password is incorrect, please try again




