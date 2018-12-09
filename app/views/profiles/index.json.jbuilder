
json.host_profiles @profiles do |profile|
    json.host_id profile.id
    json.host_name profile.name
    json.host_age profile.age
    json.host_description profile.description
    json.host_tag profile.profile_tags do |tag|
        json.host_tag_content tag.content
    end
    json.host_address profile.address
    json.profile_longitude profile.profile_longitude
    json.profile_latitude profile.profile_latitude
    json.profile_pic profile.profile_pic
    json.host_isVerified profile.isVerified
    json.host_gender profile.gender
    json.host_language profile.language
    json.host_experience profile.exp
    json.future_events profile.user.events do |event|
        if event.hosted.nil?
            json.event_id event.id
            json.event_title event.title
            json.event_description event.description
            json.event_location event.location
            json.event_chatlink event.chatlink
            json.event_isHosted event.hosted
            json.event_tag event.tags do |tag|
                json.event_tag_content tag.content
            end
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
            json.event_tag event.tags do |tag|
                json.event_tag_content tag.content
            end
        end
    end
    json.host_reviews profile.user.received_reviews do |review|
        json.reviewed_by review.author.profile.name
        json.reviewer_profile_pic profile.profile_pic
        json.review_rating review.rating
        json.review_content review.content
    end
end