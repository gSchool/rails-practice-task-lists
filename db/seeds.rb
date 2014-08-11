User.destroy_all
TaskList.destroy_all
Task.destroy_all

User.create!(
  name: "Some User",
  email: 'user@example.com',
  password: 'password',
  password_confirmation: 'password'
)

User.create!(
  name: "John Doe",
  email: 'john@example.com',
  password: 'password1',
  password_confirmation: 'password1'
)

TaskList.create!(name: "Work List")
TaskList.create!(name: "Household Chores")
