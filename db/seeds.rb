# Users
User.create(email: "a@a.com", password: "aaaaaa", username: "apple")
User.create(email: "b@b.com", password: "bbbbbb", username: "banana")
User.create(email: "c@c.com", password: "cccccc", username: "carrot")
User.create(email: "d@d.com", password: "dddddd", username: "deer")
User.create(email: "e@e.com", password: "eeeeee", username: "electricity")

# Profiles
for i in 1..5
    Profile.create({ user_id: i, name: Faker::Friends.character, age: rand(18...33), description: Faker::FamousLastWords.last_words,
                    address: Faker::Address.city, longitude: Faker::Address.longitude, latitude: Faker::Address.latitude, isVerified: false })
end

# Events
Event.create(host_id: 1, title: Faker::HarryPotter.spell, description: Faker::HarryPotter.quote) #1
Event.create(host_id: 1, title: Faker::HarryPotter.spell, description: Faker::HarryPotter.quote) #2
Event.create(host_id: 1, title: Faker::HarryPotter.spell, description: Faker::HarryPotter.quote) #3
Event.create(host_id: 2, title: Faker::HarryPotter.spell, description: Faker::HarryPotter.quote) #4
Event.create(host_id: 2, title: Faker::HarryPotter.spell, description: Faker::HarryPotter.quote) #5
Event.create(host_id: 3, title: Faker::HarryPotter.spell, description: Faker::HarryPotter.quote) #6
Event.create(host_id: 3, title: Faker::HarryPotter.spell, description: Faker::HarryPotter.quote) #7
Event.create(host_id: 3, title: Faker::HarryPotter.spell, description: Faker::HarryPotter.quote) #8

# Event Requests
EventRequest.create(event_id: 1, requester_id: 2)
EventRequest.create(event_id: 1, requester_id: 4)
EventRequest.create(event_id: 2, requester_id: 2)
EventRequest.create(event_id: 2, requester_id: 5)
EventRequest.create(event_id: 4, requester_id: 3)
EventRequest.create(event_id: 5, requester_id: 1)
EventRequest.create(event_id: 1, requester_id: 3)
EventRequest.create(event_id: 2, requester_id: 3)
EventRequest.create(event_id: 3, requester_id: 4)
EventRequest.create(event_id: 4, requester_id: 1)
EventRequest.create(event_id: 5, requester_id: 3)
EventRequest.create(event_id: 1, requester_id: 5)
EventRequest.create(event_id: 3, requester_id: 2)
EventRequest.create(event_id: 4, requester_id: 4)
EventRequest.create(event_id: 6, requester_id: 2)
EventRequest.create(event_id: 7, requester_id: 1)

# Event Waitings 
EventWaiting.create(event_id: 1, waiter_id: 3)
EventWaiting.create(event_id: 2, waiter_id: 3)
EventWaiting.create(event_id: 3, waiter_id: 4)
EventWaiting.create(event_id: 4, waiter_id: 1)
EventWaiting.create(event_id: 5, waiter_id: 3)

# Event Attendings
EventAttending.create(event_id: 1, user_id: 5)
EventAttending.create(event_id: 3, user_id: 2)
EventAttending.create(event_id: 4, user_id: 4)
EventAttending.create(event_id: 6, user_id: 2)
EventAttending.create(event_id: 7, user_id: 1)

# Reviews
Review.create(host_id: 1, author_id: 2, rating: rand(1...6), content: Faker::Simpsons.quote)
Review.create(host_id: 1, author_id: 3, rating: rand(1...6), content: Faker::Simpsons.quote)
Review.create(host_id: 2, author_id: 4, rating: rand(1...6), content: Faker::Simpsons.quote)
Review.create(host_id: 2, author_id: 1, rating: rand(1...6), content: Faker::Simpsons.quote)
Review.create(host_id: 3, author_id: 5, rating: rand(1...6), content: Faker::Simpsons.quote)

# Follows
Follow.create(follower_id: 1, followed_id: 2)
Follow.create(follower_id: 1, followed_id: 4)
Follow.create(follower_id: 2, followed_id: 1)
Follow.create(follower_id: 4, followed_id: 1)

# Tags
for i in 1..5
    5.times do
        User.find(i).profile.tags << Tag.create(profile_id: i, content: Faker::SiliconValley.company)
    end
end

# Bookmarks
Bookmark.create(user_id: 1, event_id: 4)
Bookmark.create(user_id: 1, event_id: 8)
Bookmark.create(user_id: 2, event_id: 1)
Bookmark.create(user_id: 3, event_id: 2)