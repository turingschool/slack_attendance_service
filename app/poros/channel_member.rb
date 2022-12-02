class ChannelMember 
    attr_reader :id, :slack_user_id, :name
    def initialize(slack_user_id,student_data)
        @id = nil
        @slack_user_id = slack_user_id
        @name = student_data[:user][:profile][:real_name]
    end 

end 