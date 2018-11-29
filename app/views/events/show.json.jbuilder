json.id @event.id
json.title @event.title
json.description @event.description
json.location @event.location
json.chatlink @event.chatlink
json.hosted @event.hosted
json.reviewed @event.reviewed
json.host_profile do
    json.host_id @event.host.profile.id
    json.host_name @event.host.profile.name
    json.host_age @event.host.profile.age
    json.host_description @event.host.profile.description
    json.host_tag @event.host.profile.tags do |tag|
        json.host_tag_content tag.content
    end
    json.host_address @event.host.profile.address
    json.profile_longitude @event.host.profile.profile_longitude
    json.profile_latitude @event.host.profile.profile_latitude
    json.profile_pic @event.host.profile.profile_pic.url
    json.host_isVerified @event.host.profile.isVerified
    json.host_reviews @event.host.profile.user.received_reviews do |review|
        json.reviewed_by review.author.profile.name
        json.reviewer_profile_pic review.author.profile.profile_pic.url
        json.rating review.rating
        json.content review.content
    end
end
