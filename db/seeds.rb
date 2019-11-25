# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if !User.where(:id => 0).present?
    User.create!(id: 0, username: 'Global', password: 'Global')
    User.create!(id: 1, username: 'Albert', password: 'albert')
    User.create!(id: 2, username: 'Byron', password: 'byron')
    User.create!(id: 3, username: 'Cindy', password: 'cindy')
    User.create!(id: 4, username: 'Dylan', password: 'dylan')
    User.create!(id: 5, username: 'Ethan', password: 'ethan')
    User.create!(id: 6, username: 'Frank', password: 'frank')
    User.create!(id: 7, username: 'Gibson', password: 'gibson')
    User.create!(id: 8, username: 'Haley', password: 'haley')
    User.create!(id: 9, username: 'Issac', password: 'issac')
    User.create!(id: 10, username: 'Jill', password: 'jill')
    User.create!(id: 11, username: 'Krane', password: 'krane')
    User.create!(id: 12, username: 'Liam', password: 'liam')
    User.create!(id: 13, username: 'Morty', password: 'morty')
    User.create!(id: 14, username: 'Nilson', password: 'nilson')
    User.create!(id: 15, username: 'OMG', password: 'omg')
    User.create!(id: 16, username: 'Pearson', password: 'pearson')
    User.create!(id: 17, username: 'Quintin', password: 'quintin')
    User.create!(id: 18, username: 'Rick', password: 'rick')
    User.create!(id: 19, username: 'Sterling', password: 'sterling')
    User.create!(id: 20, username: 'Terry', password: 'terry')

    WhateverChat.create!(id: 0, title: 'Meetup at San Clemente', body: 'Hey guys, we are meeting at San Clemente Center 5pm today for the future of the universe. Snacks and soft drinks available!', to_user_id: '0', from_user_id: 'Liam', alias: nil, tags: '', up_vote: 0, down_vote: 0, original_id: 0)
end

if !Ad.where(:id => 1).present?
    ad1 = File.read('storage/ads/ad1.jpeg')
    Ad.create!(name: 'Initial Ad 1', data: ad1, filename: "ad1.jpeg", tags: "test1", mime_type: "image/jpeg")
end

if !Ad.where(:id => 2).present?
    ad2 = File.read('storage/ads/ad2.jpeg')
    Ad.create!(name: 'Initial Ad 2', data: ad2, filename: "ad2.jpeg", tags: "test2", mime_type: "image/jpeg")
end
