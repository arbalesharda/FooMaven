*** Settings ***

Library     SeleniumLibrary
Library      DateTime
Resource     ../Resources/Keywords.robot
Library   SeleniumLibrary
Library   DateTime
Resource   ../Resources/Keywords.robot
*** Variables ***

${url}          http://rental34.infotiv.net/
${browser}      chrome
${about_url}    http://rental34.infotiv.net/webpage/html/gui/about.php
${home_url}     http://rental34.infotiv.net/webpage/html/gui/index.php

*** Test Cases ***

Verify Home Page Header
        [Documentation]                  Verification of the header
        [Tags]                           Test 1
        Begin Web Test
        Load Page
        Verify Logo
        Verify Title
        Verify About
        Verify User Information Field
        #End Web Test

User Enters Differenet Combination Of Credentials
        [Documentation]                  Providing invalid credentials
        [Tags]                           Test 2
        #Begin Web Test
        #Load Page
        Enter Valid Email And Invalid Password
        Enter Invalid Email And Valid Password
        Enter Invalid Email And Invalid Password
        Entering Valid Email And Valid Password
        #End Web Test

Gherkin Syntax Test Case For Date Selection
       [Documentation]                  Selecting the dates for booking a car
       [Tags]                           Test 3
       Given From Date And To Date Selector
       When Select From And To Date And Click On Continue Button
       Then Car Details Page Should Be Displayed

Test case for checking invalid boundary value for card number
       [Documentation]                  Checking the invalid input for card number
       [Tags]                           Test 4
      #Begin Web Test
     #Load Page
     #Entering Valid email and valid password
     #Select the From and To date and Click on Continue button
     #Car Details Page Should be displayed
      Select the Make and the Passengers from the DropDown
      Testing Boundary Value for the Card Number 15 digits(invalid)
     #End Web Test
     #Page should be in the book url

Test case for booking a car (long test case )
     [Documentation]                  Booking a car
     [Tags]                           Test 5
     #Begin Web Test
     #Load Page
     #Entering Valid email and valid password
     #Select the From and To date and Click on Continue button
     #Car Details Page Should be displayed
     #Select the Make and the Passengers from the DropDown
     Provides the Card details for payment
     End Web Test

Page Navigation While Booking a Car (VG_testcase_Gherkin Syntax))
       [Documentation]                  Page Navigation
       [Tags]                           Test 6
        Given User is on the confirm booking Page
        When User provides card number,card holder name, month and year of card expiry, cvc number and click on continue button
        Then User directs to the booking confirmation page
        