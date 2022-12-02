# Slack Attendance Service

This is an API that gives a student attendance report from attendance threads.
Deployed at https://slack-attendance-service.herokuapp.com/

### Prerequisites 

In order to use these endpoints, you must identify the channel id where the attendance message was sent, and the timestamp id for that message. Copy the link for the message you're trying to take attendance for -- the two values you need are in the url. 

For example, if my link is `https://turingschool.slack.com/archives/C02HRH7MF5K/p1669837541553229`, my channel id is `C02HRH7MF5K` and the timestamp is `1669837541553229`

## Endpoints

Request: 
`/api/v0/attendance?channel_id=<INSERT CHANNEL ID HERE>&timestamp=<INSERT TIMESTAMP HERE>`

Response:
```json
{
    "total_replies": 25,
    "data": [
        {
            "first_name": "Meg",
            "last_name": "Stang",
            "full_name": "Meg Stang",
            "reply_timestamp": "2022-11-30T08:46:24.992-07:00",
            "status": "present"
        },
        {
            "first_name": "Erin",
            "last_name": "Pintozzi",
            "full_name": "Erin Pintozzi",
            "reply_timestamp": "2022-11-30T08:46:29.808-07:00",
            "status": "present"
        },
        {
            "first_name": "Brian",
            "last_name": "Zanti",
            "full_name": "Brian Zanti",
            "reply_timestamp": "2022-11-30T08:46:36.756-07:00",
            "status": "present"
        },
        {
            "first_name": "Mike",
            "last_name": "Dao ",
            "full_name": "Mike Dao ",
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

