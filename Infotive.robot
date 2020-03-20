*** Settings ***

Library     SeleniumLibrary
Library      DateTime
Resource     ../Resources/Keywords.robot
Test Setup  Start Browser And Maximize
Test Teardown   Close Browser
*** Variables ***

${url}          http://rental34.infotiv.net/
${browser}      chrome
${about_url}    http://rental34.infotiv.net/webpage/html/gui/about.php
${home_url}     http://rental34.infotiv.net/webpage/html/gui/index.php

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

