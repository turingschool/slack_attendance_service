class ChannelMemberSerializer
    include JSONAPI::Serializer
    attributes :slack_user_id, :name
   
end 