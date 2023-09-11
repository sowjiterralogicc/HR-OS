*** Settings ***
Library   SeleniumLibrary
Resource   ../Variables/Hr_daily_base_sheet_variables.robot
Resource   ../Variables/Hr_weekly_basis_variables.robot
Library    DateTime
Library    String
Library    Collections

*** Keywords ***
Mouse Over TO Task Header
	Mouse Over      ${Task_Header_xpath}
    sleep   10s
Click On Weekly Basis Button
	Click ELement    ${Weekily_lable_xpath}
Click On TimeSheet Menu
	Wait Until Element Is Visible    ${timesheet}
    Click Element    ${timesheet}
    Sleep   5s
Time Sheet for a week on Weekly basis
	${current_date} =    Get Current Date    result_format=%Y-%m-%d
    @{week_days}   Create List

    FOR    ${i}    IN RANGE    0    7   # 8 to include the current date
           ${date}=    Add Time To Date    ${current_date}    ${i} days
           ${date_without_time}=    Set Variable    ${date}[0:10]
           ${weekday_name} =    Evaluate    datetime.datetime.strptime("${date_without_time}", "%Y-%m-%d").strftime("%A")
           Run Keyword Unless    '${weekday_name}' in @{Weekend}     Append To List   ${week_days}   ${date_without_time}
    END
    ${start_date}=  Set Variable    xpath://td[@title='${weekdays}[0]']
    ${End_date}=  Set Variable    xpath://td[@title='${weekdays}[-1]']

    Wait Until Element Is Visible    ${addtask}
    Click Element    ${addtask}
    Sleep    5s

    Click Element    ${calendar}
    Sleep    7s

    Click Element   ${start_date}
    Sleep    5s

    Click Element    ${end_date}
    Sleep    5s

    Press Keys    ${select_start_time}    9:00 am
    Sleep    6s

    Click Element    ${select_start_time1}
    Sleep    6s

    Press Keys    ${select_end_time}    6:00 pm
    Sleep    5s

    Click Element    ${select_end_time1}
    Sleep    5s

    Press Keys    ${select_project}    Rampup_Software Services
    Sleep    5s

    Click Element    ${select_project_name}
    Sleep    2s

    Input Text    ${task_name}    ${task_name_value}
    Sleep    2s

    Input Text    ${description}    ${description_value}
    Sleep    2s

    Click Element    ${submit}
    Sleep    10s

