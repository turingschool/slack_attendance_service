class SlackFacade 
    def self.get_replies_from_message(channel_id,timestamp)
        message_start_time =  timestamp.to_f/1000000
        conversation_data = SlackService.conversation_data(channel_id,message_start_time)
        replies = conversation_data[:messages][1..-1]
        students_and_answer_time = {}
        replies.each do |reply|
            time = Time.at(reply[:ts].to_f)
            if !Student.exists?(slack_user_id: reply[:user])
                student_data = SlackService.student_data(reply[:user])
                user = Student.create({slack_user_id: reply[:user], first_name: student_data[:user][:profile][:first_name], last_name: student_data[:user][:profile][:last_name]})
            else
                user = Student.find_by(slack_user_id: reply[:user]) 
            end  
            if students_and_answer_time[user].nil?
                students_and_answer_time[user] = time
            end 
        end 
        students_and_answer_time.map do |student,reply_timestamp|
            StudentReport.new(student, reply_timestamp, message_start_time)
        end.sort_by do |student_report|
            student_report.last_name
        end 
    end 
end 



