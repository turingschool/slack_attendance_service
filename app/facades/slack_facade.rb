class SlackFacade 
    def self.get_replies_from_message(channel_id,timestamp)
        timestamp =  timestamp.to_f/1000000
        conversation_data = SlackService.conversation_data(channel_id,timestamp)
        replies = conversation_data[:messages][1..-1]
        students_and_answer_time = {}
        replies.each do |reply|
            time = Time.at(reply[:ts].to_f)
            student_data = SlackService.student_data(reply[:user])
            user_name = student_data[:user][:profile][:first_name] + " " + student_data[:user][:profile][:last_name]
            if students_and_answer_time[user_name].nil?
                students_and_answer_time[user_name] = {
                    first_name: student_data[:user][:profile][:first_name],
                    last_name: student_data[:user][:profile][:last_name],
                    timestamp: time
                }
            end 
        end 
        students_and_answer_time.values.map do |student_data|
            Student.new(student_data, timestamp)
        end.sort_by do |student|
            student.last_name
        end 
    end 
end 



