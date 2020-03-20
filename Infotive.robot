*** Settings ***
Library     SeleniumLibrary
Library      DateTime
Test Setup  Start Browser And Maximize
Test Teardown   Close  Browser

*** Variables ***

${url}          http://rental34.infotiv.net/
${browser}      chrome
${about_url}    http://rental34.infotiv.net/webpage/html/gui/about.php
${home_url}     http://rental34.infotiv.net/webpage/html/gui/index.php


*** Keywords ***

Start Browser And Maximize
    Open Browser  ${URL}  ${Browser}
    Maximize Browser Window

End Browser
    Close  Browser
#TC1
Verify Logo
   Click Element          xpath://*[@id="logo"]
   Page Should Contain    When do you want to make your trip?
   ${link_text}          Get Text        xpath://*[@id="questionText"]
   Log                   ${link_text}
   Should Be Equal       ${link_text}      When do you want to make your trip?



Verify Title
   ${title_text}      Get Text       //*[@id="title"]
   Should be Equal        ${title_text}       Infotiv Car Rental
   Click Element       xpath://*[@id="title"]
   ${link_text}          Get Text        xpath://*[@id="questionText"]
   Log                   ${link_text}
   Should Be Equal       ${link_text}      When do you want to make your trip?

Verify About
    ${about_text}      Get Text        xpath://*[@id="about"]
    Should be Equal     ${about_text}      ABOUT
    Click Element        xpath://*[@id="about"]
    Page Should Contain Element       link:Documentation


Navigate from About to Home Page and vice-versa

    Go To              ${home_url}
    sleep   3
    Go back
    sleep   3
    Go To              ${home_url}


Verify User Information Field
    Page Should Contain Textfield       xpath://*[@id="email"]
    Page Should Contain Textfield       xpath://*[@id="password"]

#TC 2 (decision table )
Enter Valid Email And Invalid Password
    Click Element        xpath://*[@id="email"]
    Input Text           name:email          sharda.darekar@gmail.com
    Input Text             name:pass       Shardasworld
    Click Button            xpath://*[@id="login"]
    Page Should Contain     Wrong e-mail or password

Enter Invalid Email And Valid Password
    Click Element        xpath://*[@id="email"]
    Input Text           name:email           sharda1.darekar@gmail.com
    sleep     3
    Input Text             name:pass       Shardasworlds
    sleep     3
    Click Button            xpath://*[@id="login"]
    Page Should Contain     Wrong e-mail or password

Enter Invalid Email And Invalid Password
    Click Element        xpath://*[@id="email"]
    Input Text           name:email           sharda1.darekar@gmail.com
    sleep     3
    Input Text             name:pass       sharda@2344
    sleep     3
    Click Button            xpath://*[@id="login"]
    Page Should Contain     Wrong e-mail or password

Entering Valid Email And Valid Password
    Click Element        xpath://*[@id="email"]
    Input Text           name:email          sharda.darekar@gmail.com
    Input Text           name:pass           Shardasworld1
    Click Button         xpath://*[@id="login"]
    Click Element        xpath://*[@id="title"]

#TC 3 (Selecting from and to date)
Verify From And To Selector
    Page Should Contain              When do you want to make your trip?
    sleep                            3
    Page Should Contain Element      id:start
    Page Should Contain Element      id:end


From Date And To Date Selector

     Start Browser And Maximize
     Entering Valid email and valid password
     Verify From and To selector

Select Date And Click On Continue Button
    ${min_start_date}        Get Element Attribute     id:start      attribute=min
    ${current_date}          Get Current Date          local         result_format=%Y-%m-%d
    Should be Equal          ${current_date}           ${min_start_date}
    ${max_end_date}         Get Element Attribute      id:end         attribute=max
    ${max_date}             Add time to date           ${current_date}      31days        result_format=%Y-%m-%d
    Should be Equal         ${max_end_date}            ${max_date}
    Click Element           xpath://*[@id="start"]
    Press Keys               xpath://*[@id="start"]   {03-25}
    Press Keys               xpath://*[@id="end"]       {03-27}
    Click Button                      id:continue

Car Details Page Should Be Displayed
    Page Should Contain Element        id:questionText
    Page Should Contain Element        id:ms-list-1
    Page Should Contain Element        id:ms-list-2
    sleep                              3
    #End Web Test

*** Test Cases ***

Verify Home Page Header
        [Documentation]                  Verification of the header
        [Tags]                           Test 1

        Verify Logo
        Verify Title
        Verify About
        Verify User Information Field


User Enters Differenet Combination Of Credentials
        [Documentation]                  Providing invalid credentials
        [Tags]                           Test 2

        Enter Valid Email And Invalid Password
        Enter Invalid Email And Valid Password
        Enter Invalid Email And Invalid Password
        Entering Valid Email And Valid Password


Gherkin Syntax Test Case For Date Selection
       [Documentation]                  Selecting the dates for booking a car
       [Tags]                           Test 3
       Given From Date And To Date Selector
       When Select Date And Click On Continue Button
       Then Car Details Page Should Be Displayed

