
json.profiles @profiles do |profile|
    json.id profile.id
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
            json.event_id event.id
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
            json.event_id event.id
            json.event_title event.title
            json.event_description event.description
            json.event_location event.location
            json.event_chatlink event.chatlink
            json.event_isHosted event.hosted
            json.event_reviewed event.reviewed
        end
    end
    json.reviews profile.user.received_reviews do |review|
        json.reviewed_by review.author.profile.name
        json.reviewer_profile_pic profile.profile_pic.url
        json.rating review.rating
        json.content review.content
    end
end