N = 10

birzhan = User.create(username: 'birzhan', password: 'password', email: 'test@mail.com')

# Create a few users
N.times do
  user = User.create!(username: Faker::Internet.username, email: Faker::Internet.email, password: "password")
end


# Create some notes
User.find_each do |user|
  N.times do |i|
    user.notes.create!(body: Faker::Lorem.sentence, date: Date.today - i)
  end

  # Create some subscriptions
  rand(1..N).times do
    Subscription.create(user: User.all.sample, subscriber: user)
  end

  rand(1..N).times do
    Subscription.create(user: user, subscriber: User.all.sample)
  end
end

