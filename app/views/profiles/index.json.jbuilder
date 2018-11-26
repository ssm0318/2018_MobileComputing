
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
end