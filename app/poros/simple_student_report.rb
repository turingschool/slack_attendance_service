class SimpleStudentReport 
    attr_reader :timestamp, :slack_id

    def initialize(user_id,reply_timestamp,message_send_time)
        @timestamp = reply_timestamp
        @message_send_time = message_send_time
        @slack_id = user_id
    end 

    def attendance_start_time
       @start_time ||= (Time.at(@message_send_time.to_f).end_of_hour + 360)
    end 

    def status 
        return "present" if respond_before_5_after?
        return "tardy" if respond_between_5_and_30?
        return "absent" 
    end 

    def respond_before_5_after?
        (attendance_start_time - @timestamp) > 0
    end 

    def respond_between_5_and_30?
        0 > (attendance_start_time - @timestamp) && (attendance_start_time - @timestamp) > -1500
    end 
end 