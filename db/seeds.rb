

20.times do
  user = User.create! status: 'active',
                      email: Faker::Internet.email,
                      password: 'password',
                      password_confirmation: 'password',
                      name: Faker::Name.name,
                      facebook: Faker::Internet.user_name

  user.posts.create body: Faker::Lorem.paragraph
end
