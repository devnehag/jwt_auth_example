# Create a few users with usernames and passwords
users_data = [
  { username: 'user1', password: 'password1' },
  { username: 'user2', password: 'password2' },
  # Add more users as needed
]

users_data.each do |user_data|
  User.create(user_data)
end