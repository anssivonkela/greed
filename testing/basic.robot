*** Settings ***
Suite Teardown    Delete All Sessions
Library           Collections
Library           String
Library           RequestsKeywords.py
Library           OperatingSystem

*** Test Cases ***
# Get intial possibly empty list of users
Get Request Users
    [Tags]    get
    Create Session    playas    http://172.17.0.3:8000
    ${resp}=    Get Request    playas    /v1/users/
    Should Be Equal As Strings    ${resp.status_code}    200

# Get intial possibly empty list of games
Get Request Games
    [Tags]    get
    ${resp}=    Get Request    playas    /v1/games/
    Should Be Equal As Strings    ${resp.status_code}    200

# Post first player
Post Request UserA With File
    [Tags]    post
    ${file_data}=    Get Binary File    ${CURDIR}${/}usera.json
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp}=    Post Request    playas    /v1/users/    data=${file_data}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    201

# Post a second player
Post Request UserB With File 
    [Tags]    post
    ${file_data}=    Get Binary File    ${CURDIR}${/}userb.json
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp}=    Post Request    playas    /v1/users/    data=${file_data}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    201
    ${playeraid}=    Set Variable    ${resp.json()['id']} 
    Should Be Equal As Strings    ${resp.json()['name']}    Gordon


# Post a game
Post Request Game With File
    [Tags]    post
    ${file_data}=    Get Binary File    ${CURDIR}${/}game.json
    ${headers}=    Create Dictionary    Content-Type=application/json
    ${resp}=    Post Request    playas    /v1/games/    data=${file_data}    headers=${headers}
    Should Be Equal As Strings    ${resp.status_code}    201


# Count games
Get Request Users Again
    [Tags]    get
    Create Session    playas    http://172.17.0.3:8000
    ${resp}=    Get Request    playas    /v1/users/
    Should Be Equal As Strings    ${resp.status_code}    200
    ${len}=    Get Length     ${resp.json()}
    Should Be True    1 < ${len}


