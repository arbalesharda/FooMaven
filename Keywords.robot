*** Settings ***
Library     SeleniumLibrary
Library     DateTime

*** Keywords ***

Begin Web Test
    Open Browser      about:blank     ${browser}

Load Page
   Go To                          ${url}
   Maximize Browser Window

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
   #Page Should Contain       When do you want to make your trip?
   ${link_text}          Get Text        xpath://*[@id="questionText"]
   Log                   ${link_text}
   Should Be Equal       ${link_text}      When do you want to make your trip?

Verify About
    ${about_text}      Get Text        xpath://*[@id="about"]
    Should be Equal     ${about_text}      ABOUT
    Click Element        xpath://*[@id="about"]
    Page Should Contain Element       link:Documentation


   # Verify Link
    #${about_link}      Get Element Attribute   css:id                   about
    #Should be Equal    ${about_link}         http://rental34.infotiv.net/webpage/html/gui/about.php
    #Page Should Contain          Welcome


Navigate from About to Home Page and vice-versa

    Go To              ${home_url}
    sleep   3
    Go back
    sleep   3
    Go To              ${home_url}


Verify User Information Field
    Page Should Contain Textfield       xpath://*[@id="email"]
    Page Should Contain Textfield       xpath://*[@id="password"]
    #Element Should be Visible   id:E-mail

#TC 2 (decision table )
Enter Valid Email And Invalid Password
    Click Element        xpath://*[@id="email"]
    Input Text           name:email          sharda.darekar@gmail.com
    sleep     3
    Input Text             name:pass       Shardasworld
    sleep     3
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
    #Click Button                      id:continue

From Date And To Date Selector
     Verify From And To Selector


#Verify invalid boundary value for min date
   #  ${invalid_bv_min}       Subtract time to date       ${current_date}      1days        result_format=%Y-%m-%d
    # Press Key               xpath://*[@id="start"]    ${invalid_bv_min}
     #Should not be equal      ${invalid_bv_min}        ${current_date}

Select From And To Date And Click On Continue Button
    ${min_start_date}        Get Element Attribute     id:start      attribute=min
    ${current_date}          Get Current Date          local         result_format=%Y-%m-%d
    Should be Equal          ${current_date}           ${min_start_date}
    ${max_end_date}         Get Element Attribute      id:end         attribute=max
    ${max_date}             Add time to date           ${current_date}      31days        result_format=%Y-%m-%d
    Should be Equal         ${max_end_date}            ${max_date}
    Click Element           xpath://*[@id="start"]
    Press Keys               xpath://*[@id="start"]   {03-25}
    #Press Keys               xpath://*[@id="start"]
    #Click Element           xpath://*[@id="end"]
    #${end_date}             Add time to date           ${current_date}      2days        result_format=%Y-%m-%d
    #Press Key               xpath://*[@id="end"]        ${max_date}
    Press Keys               xpath://*[@id="end"]       {03-27}
    #Select from list by value      start            2020-02-25
    Click Button                      id:continue

Car Details Page Should Be Displayed
    Page Should Contain Element        id:questionText
    Page Should Contain Element        id:ms-list-1
    Page Should Contain Element        id:ms-list-2
    sleep                              3
    #End Web Test

Select the Make and the Passengers from the DropDown
    Click Button          xpath://*[@id="ms-list-1"]/button
    Select Checkbox       xpath://*[@id="ms-opt-4"]
    #Select Checkbox      xpath://*[@id="ms-opt-2"]
    #Press Keys           xpath://*[@id="ms-list-1"]  {opel}
    #Select from List By Value      xpath://*[@id="ms-list-1"]/button              4
    Click Button          xpath://*[@id="ms-list-2"]/button
    #Select Checkbox       xpath://*[@id="ms-opt-5"]
    Select Checkbox        xpath://*[@id="ms-opt-6"]
    Click Element          xpath://*[@id="rightpane"]
    #Execute Javascript    window.scrollTo(0,700)
    sleep                   2
    Click Element            xpath://*[@id="carSelect1"]
    #Page Should Contain    Confirm booking of Audi Q7

Provides the Card details for payment
     Input Text           id:cardNum       1234123412341234
     Input Text           id:fullName      Anna ELsa
     #Click Element        xpath://*[@id="confirmSelection"]/form/select[1]
     #Select               xpath://*[@id="month10"]
     Select from list by index   xpath://*[@id="confirmSelection"]/form/select[1]        9
     Select from list by index  xpath://*[@id="confirmSelection"]/form/select[2]         2
     Input Text          id:cvc            123
     Click Button        xpath://*[@id="confirm"]
     Page Should Contain      You can view your booking on your page
     Click Button           xpath://*[@id="mypage"]
     Page Should Contain     My bookings
     Page Should Contain Element      xpath://*[@id="middlepane"]/table/tbody/tr[1]/th[2]
     #${brand_name}        Get Element Attribute      id:ms-opt-3           attribute=title
     #${brand_mypage}      Get Element Attribute     class:orderTD
     #Should be Equal       ${brand_name}             Tesla

Testing Boundary Value for the Card Number 15 digits(invalid)
     Input Text            id:cardNum          123412341234123
     sleep                    3
     ${length}             Get Element Attribute      id:cardNum         attribute=maxlength-1
     Should Not be Equal      ${length}           16
     Input Text            id:fullName      Anna ELsa
     #Click Element        xpath://*[@id="confirmSelection"]/form/select[1]
     #Select               xpath://*[@id="month10"]
     Select from list by index   xpath://*[@id="confirmSelection"]/form/select[1]        9
     Select from list by index  xpath://*[@id="confirmSelection"]/form/select[2]         2
     Input Text          id:cvc            123
     Click Button        xpath://*[@id="confirm"]
     sleep               3
     #Alert Should be Present         Please match the format requested
     #sleep        3
     #Page Should Contain     Please match the format requested.
     Page Should Contain      Confirm booking of

End Web Test
    close browser

#VG-TC
User is on the confirm booking Page
     Begin Web Test
     Load Page
     Entering Valid Email And Valid Password
     Select From And To Date And Click On Continue Button
     Select the Make and the Passengers from the DropDown

User provides card number,card holder name, month and year of card expiry, cvc number and click on continue button
     Provides the Card details for payment (VG_TC)

User directs to the booking confirmation page
     Page Should Contain      You can view your booking on your page
     End Web Test

Provides the Card details for payment (VG_TC)
     Input Text           id:cardNum       1234123412341234
     Input Text           id:fullName      Anna ELsa
     #Click Element        xpath://*[@id="confirmSelection"]/form/select[1]
     #Select               xpath://*[@id="month10"]
     Select from list by index   xpath://*[@id="confirmSelection"]/form/select[1]        9
     Select from list by index  xpath://*[@id="confirmSelection"]/form/select[2]         2
     Input Text          id:cvc            123
     Click Button        xpath://*[@id="confirm"]