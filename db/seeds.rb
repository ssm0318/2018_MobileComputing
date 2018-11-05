5.times do
    Event.create({
        title: Faker::HarryPotter.spell,
        description: Faker::Lorem.sentences(3)
    })
end