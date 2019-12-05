require 'pp'
require 'bcrypt'

post_num = 10000
user_num = 10000
names = File.readlines(Rails.root.join('db','seeds','large.csv')).map{ |line| line.chop }
tags = File.readlines(Rails.root.join('db','seeds','noun-tags.csv')).map{ |line| line.chop }

# names.each { |name| 
#   if !User.where(username: name).present?
#     User.create!(username: name, password: 'password')
#   end
# }

password = BCrypt::Password.create 'password'
User.insert_all(names.map {|n| {username: n, 
                                password_digest: password, 
                                created_at: Time.now,
                                updated_at: Time.now
}})

# post_num.times { whateverchat.create!(title: 'meetup at san' + names.sample, 
#                                  body: 'hey guys, we are meeting at san clemente center 5pm today for the future of the universe. snacks and soft drinks available!', 
#                                  to_user_id: '0', 
#                                  from_user_id: names.sample, 
#                                  alias: nil, 
#                                  tags: '', 
#                                  up_vote: 0, 
#                                  down_vote: 0, 
#                                  original_id: 0) }

posts = []
post_num.times do
  posts.append ({ title: 'meetup at san' + names.sample, 
                 body: 'hey guys, we are meeting at san clemente center 5pm today for the future of the universe. snacks and soft drinks available!', 
                 to_user_id: '0', 
                 from_user_id: names.sample, 
                 alias: nil, 
                 tags: '', 
                 up_vote: 0, 
                 down_vote: 0, 
                 original_id: 0,
                 created_at: Time.now,
                 updated_at: Time.now })
end
WhateverChat.insert_all(posts)


# ---- ads
100.times { |id|
    tag = tags.sample
    puts 'seeding image with tag: ' + tag + ', id: ' + id.to_s
    ad = Ad.create!(
      name: 'random', 
      filename: "random.jpg", 
      tags: tag, 
      mime_type: "image/jpeg")
    ad.image.attach(io: File.open('storage/images/random' + id.to_s + '.jpg'), filename: 'file.pdf')
}

# 10*post_num.times {
#   Comment.create!(
#     whatever_chat_id: rand(post_num),
#     userid: rand(user_num), 
#     alias: nil, 
#     body: "this is a comment"
#   )
# }

comments = []
(10*post_num).times do
  comments.append({
    whatever_chat_id: rand(post_num),
    userid: rand(user_num), 
    alias: nil, 
    body: "this is a comment",
    created_at: Time.now,
    updated_at: Time.now })
end
Comment.insert_all(comments)

votes = []
(10*post_num).times do
  votes.append({
    username: names.sample,
    whatever_chat_id: rand(post_num), 
    att: [:up, :down, :neutral].sample,
    created_at: Time.now,
    updated_at: Time.now })
end
Vote.insert_all(votes)

# 10*post_num.times {
#   Vote.create!(
#     username: names.sample,
#     whatever_chat_id: rand(post_num), 
#     att: [:up, :down, :neutral].sample,
#   )
# }

