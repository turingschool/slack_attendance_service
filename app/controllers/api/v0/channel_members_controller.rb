class Api::V0::ChannelMembersController < ApplicationController
    def index 
        channel_id = params[:channel_id]
        members = SlackFacade.get_members_of_channel(channel_id)
        render json: ChannelMemberSerializer.new(members)
    end 
end 