class Api::V0::AttendanceController < ApplicationController 
    def index 
        channel_id = params[:channel_id]
        timestamp = params[:timestamp]
        student_responses = SlackFacade.get_replies_from_message(channel_id,timestamp)
        render json: AttendanceSerializer.report(student_responses)
    end 
end 