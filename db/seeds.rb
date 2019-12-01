# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if !User.where(:id => 0).present?
    puts '-------------------------------------'
    puts 'No global'
    puts '-------------------------------------'
    User.create!(id: 0, username: 'Global', password: 'Global')
end

if !Ad.where(:id => 1).present?
    ad1 = Ad.create!(name: 'Initial Ad 1', filename: "ad1.jpeg", tags: "test1", mime_type: "image/jpeg")
    ad1.image.attach(io: File.open('storage/ads/ad1.jpeg'), filename: 'file.pdf')
end

if !Ad.where(:id => 2).present?
    ad2 = Ad.create!(name: 'Initial Ad 2', filename: "ad2.jpeg", tags: "test2", mime_type: "image/jpeg")
    ad2.image.attach(io: File.open('storage/ads/ad2.jpeg'), filename: 'file.pdf')
end

