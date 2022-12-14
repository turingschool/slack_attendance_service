# Slack Attendance Service

This is an API that gives a student attendance report from attendance threads.
Deployed at https://slack-attendance-service.herokuapp.com/

### Prerequisites 

In order to use these endpoints, you must identify the channel id where the attendance message was sent, and the timestamp id for that message. Copy the link for the message you're trying to take attendance for -- the two values you need are in the url. 

For example, if my link is `https://turingschool.slack.com/archives/C02HRH7MF5K/p1669837541553229`, my channel id is `C02HRH7MF5K` and the timestamp is `1669837541553229`

## Endpoints

<details close>
<summary>Get Attendance Report</summary>
<br>

Request: 
**GET** `/api/v0/attendance?channel_id=C02HRH7MF5K&timestamp=1669837541553229`
    
Headers: <br>
```
    Content-Type: application/json
    Accept: application/json
```

Response:
```json
{
    "total_replies": 25,
    "attendance_start_time": "2022-11-30T16:00:59.999+00:00",
    "data": [
        {
            "first_name": "Meg",
            "last_name": "Stang",
            "full_name": "Meg Stang",
            "email": "mstang@turing.edu",
            "reply_timestamp": "2022-11-30T08:46:24.992-07:00",
            "status": "present"
        },
        {
            "first_name": "Erin",
            "last_name": "Pintozzi",
            "full_name": "Erin Pintozzi",
            "email": "epintozzi@turing.edu",
            "reply_timestamp": "2022-11-30T08:46:29.808-07:00",
            "status": "present"
        },
        {
            "first_name": "Brian",
            "last_name": "Zanti",
            "email": "brian@turing.edu",
            "reply_timestamp": "2022-11-30T08:46:36.756-07:00",
            "status": "present"
        },
        {
            "first_name": "Mike",
            "last_name": "Dao ",
            "email": "mike@turing.edu",
            "reply_timestamp": "2022-11-30T09:09:58.175-07:00",
            "status": "tardy"
        },
        {...},
        {...},
        ...
        ...
       ]
   }
```

</details>


<details close>
<summary>Get Channel Members</summary>
<br>

Request: 
**GET** `/api/v0/channel_members?channel_id=C02HRH7MF5K`

Headers: <br>
```
    Content-Type: application/json
    Accept: application/json
```
    
Response: 
```json
{
    "data": [
        {
            "id": null,
            "type": "channel_member",
            "attributes": {
                "slack_user_id": "U02Q25H6V",
                "name": "Mike Dao"
            }
        },
        {
            "id": null,
            "type": "channel_member",
            "attributes": {
                "slack_user_id": "U0C6CG4RL",
                "name": "Allison Reu Singer (she/her)"
            }
        },
        {
            "id": null,
            "type": "channel_member",
            "attributes": {
                "slack_user_id": "U1C9WHFFS",
                "name": "Meg Stang"
            }
        },
        ...
        ...
        ...
       ]
 }
```

</details>

