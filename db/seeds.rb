(0..10).each do
    User.create(email: Faker::Internet.email, password: Faker::Internet.password, username: Faker::Internet.username, name: Faker::Name.name)
end

(0..10).each do
    Playlist.create(user_id: rand(0..10), name: Faker::Lorem.word)
end

(0..10).each do
    Movie.create(imdb_id: rand(0..10), title: Faker::Movie.title)
end


