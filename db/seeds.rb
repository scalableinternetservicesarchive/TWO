# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

if !User.where(:id => 1).present?
    User.create!(id: 0,username: 'Global', password: 'Global')
end

if !Ad.where(:id => 1).present?
    ad1 = File.read('storage/ads/ad1.jpeg')
    Ad.create!(id: 1,name: 'Initial Ad 1', data: ad1, filename: "ad1.jpeg", tags: "test1", mime_type: "image/jpeg")
end

if !Ad.where(:id => 2).present?
    ad2 = File.read('storage/ads/ad2.jpeg')
    Ad.create!(id: 2,name: 'Initial Ad 2', data: ad2, filename: "ad2.jpeg", tags: "test2", mime_type: "image/jpeg")
end