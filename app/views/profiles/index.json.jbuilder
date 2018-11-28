
json.profiles @profiles do |profile|
    json.name profile.name
    json.age profile.age
    json.description profile.description
    json.tag profile.tags do |tag|
        json.tag_content tag.content
    end
    json.address profile.address
    json.profile_longitude profile.profile_longitude
    json.profile_latitude profile.profile_latitude
    json.profile_pic profile.profile_pic.url
    json.isVerified profile.isVerified
    json.future_events profile.user.events do |event|
        if event.hosted.nil?
            json.event_title event.title
            json.event_description event.description
            json.event_location event.location
            json.event_chatlink event.chatlink
            json.event_isHosted event.hosted
            json.event_reviewed event.reviewed
        end
    end
    json.past_events profile.user.events do |event|
        if !event.hosted.nil?
            json.event_title event.title
            json.event_description event.description
            json.event_location event.location
            json.event_chatlink event.chatlink
            json.event_isHosted event.hosted
            json.event_reviewed event.reviewed
        end
    end
end