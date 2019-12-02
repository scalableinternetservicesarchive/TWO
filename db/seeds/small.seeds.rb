require 'pp'

names = File.readlines(Rails.root.join('db','seeds','small.csv')).map{ |line| line.chop }
tags = File.readlines(Rails.root.join('db','seeds','noun-tags.csv')).map{ |line| line.chop }

names.each { |name| 
  if !User.where(username: name).present?
    User.create!(username: name, password: 'password')
  end
}

100.times { WhateverChat.create!(title: 'Meetup at San' + names.sample, 
                                 body: 'Hey guys, we are meeting at San Clemente Center 5pm today for the future of the universe. Snacks and soft drinks available!', 
                                 to_user_id: '0', 
                                 from_user_id: names.sample, 
                                 alias: nil, 
                                 tags: '', 
                                 up_vote: 0, 
                                 down_vote: 0, 
                                 original_id: 0) }

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