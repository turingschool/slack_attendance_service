class Api::V0::AttendanceController < ApplicationController 
    def index 
        channel_id = params[:channel_id]
        timestamp = params[:timestamp]
        attendance_start_time = (Time.at(timestamp.to_f/1000000).end_of_hour + 60)
        student_responses = SlackFacade.get_replies_from_message(channel_id,timestamp)
        render json: AttendanceSerializer.report(student_responses, attendance_start_time)
    end 
end 