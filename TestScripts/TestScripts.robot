*** Settings ***
Resource          ../Resources/common.robot
Library           String
Library           DataDriver                  reader_class=TestDataApi    name=Creation_Contact.xlsx
Suite Setup       Setup Browser
Suite Teardown    End Suite
Test Template     create contacts using excel

*** Test Cases ***
create contacts using excel with ${C_Salutation}    ${C_FirstName}     ${C_LastName}    ${C_Phone}

*** Keywords ***
create contacts using excel
    [Arguments]    ${C_Salutation}    ${C_FirstName}     ${C_LastName}    ${C_Phone}
    Appstate                    Home
    LaunchApp                   Sales
    ClickText                   Contacts
    VerifyText                  Recently Viewed             timeout=120s
    ClickText                   New                         anchor=import               timeout=120s
    UseModal                    On
    PickList                    Salutation                  ${C_Salutation}
    TypeText                    First Name                  ${C_FirstName}
    TypeText                    Last Name                   ${C_LastName}
    ${fullName}                 Catenate                    ${C_FirstName}              ${C_LastName}
    TypeText                    Phone                       ${C_Phone}
    ComboBox                    Search Accounts...          Dickenson plc
    TypeText                    Email                       tara@gamil.com
    TypeText                    Mailing Street              hanuman nagar 4th line
    TypeText                    Mailing City                guntur
    TypeText                    Mailing State/Province      ap
    TypeText                    Mailing Zip/Postal Code     522006
    TypeText                    Mailing Country             india
    TypeText                    Other Street                vijayapuri colony
    TypeText                    Other City                  guntur
    TypeText                    Other State/Province        ap
    TypeText                    Other Zip/Postal Code       52206
    TypeText                    Other Country               india
    TypeText                    Fax                         9876503467
    PickList                    Lead Source                 Web
    TypeText                    Home Phone                  2218868
    ClickText                   Birthdate                   anchor=Home Phone
    DropDown                    Pick a Year                 1979
    ClickText                   Previous                    Month
    ClickText                   Previous                    Month
    ClickText                   Previous                    Month
    ClickText                   20
    TypeText                    Other Phone                 0866667734
    TypeText                    Department                  tesing department
    TypeText                    Assistant                   no assistant
    TypeText                    Asst. Phone                 +7207207177
    TypeText                    Mobile                      9966119982
    TypeText                    Description                 learning copado robotic testing
    ClickText                   Save                        partial_match=False
    UseModal                    Off
    Sleep                       1

 # Delete generated contacts for cleanup
    #LaunchApp                   Sales
    #Wait Until Keyword Succeeds                             1 min                       5 sec            ClickText    Contacts
    #VerifyText                  Recently Viewed             timeout=120s
    #ClickText                   ${fullName}                 timeout=120s
    #ClickText                   Show more actions
    #ClickText                   Delete
    #ClickText                   Delete
    #ClickText                   Close
    #VerifyText                  Recently Viewed             timeout=120s