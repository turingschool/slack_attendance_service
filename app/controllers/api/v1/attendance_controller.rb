class Api::V1::AttendanceController < ApplicationController 
    def index 
        channel_id = params[:channel_id]
        timestamp = params[:timestamp]
        attendance_start_time = (Time.at(timestamp.to_f/1000000).end_of_hour + 60)
        student_responses = SlackFacade.replies_from_message_v1(channel_id,timestamp)
        render json: AttendanceSerializer.simple_report(student_responses, attendance_start_time)
    end 
end 