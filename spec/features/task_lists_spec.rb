require 'rails_helper'
require 'capybara/rails'

feature 'Task lists' do

  scenario 'User can view task lists' do
    user = create_user email: "user@example.com"
    TaskList.create!(name: "Work List")
    TaskList.create!(name: "Household Chores")

    login(user)
    expect(page).to have_content("Work List")
    expect(page).to have_content("Household Chores")
  end

end