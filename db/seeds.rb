# delete
Comment.delete_all
Post.delete_all
User.delete_all

# users
User.create first_name: "Alex",
            last_name: "Taylor",
            email: "alexmctaylorpants@gmail.com",
            password: "password"

# guest users
25.times do
  first_name = Faker::Name.first_name
  last_name = Faker::Name.last_name
  u = User.create first_name: first_name,
                  last_name: last_name,
                  email: "#{first_name}.#{last_name}@#{Faker::Internet.domain_name}",
                  password: "password"
end

# posts, comments
100.times do
  p = Post.create title: Faker::Lorem.sentence,
                  body: Faker::Lorem.paragraph(2, true, 15),
                  user: User.all.sample
  rand(15).times do
    c = Comment.create body: "#{Faker::Hacker.say_something_smart} #{Faker::Lorem.sentence(3,true,8)}",
                       post: p,
                       user: User.all.sample
    c.save
  end
  p.save
end

# tags
tags = %w(ruby rails javascript css html postgres react random personal jquery)
tags.each do |t|
  Tag.create name: t
end
