require 'rails_helper'
require 'capybara/rails'

feature 'Tasks' do

  scenario 'User can view tasks' do
    user = create_user email: "user@example.com"
    TaskList.create!(name: "Work List")

    login(user)
    expect(page).to have_content("Nothing here to see!")
    click_on "+ Add Task", match: :first
    fill_in "Description", with: "Something important"
    two_days_from_now = 2.days.from_now.to_date
    select two_days_from_now.strftime("%Y"), from: "task_due_date_1i"
    select two_days_from_now.strftime("%B"), from: "task_due_date_2i"
    select two_days_from_now.strftime("%-d"), from: "task_due_date_3i"
    click_on "Create Task"

    expect(page).to have_content("Something important")
    expect(page).to have_content("Task was created successfully!")
    expect(page).to have_content("2 days")
    expect(page).to have_no_content("Nothing here to see!")
  end

  scenario 'User can complete tasks' do
    user = create_user email: "user@example.com"
    task_list = TaskList.create!(name: "Work List")
    task = task_list.tasks.create!(description: "Some task", due_date: 2.days.from_now)

    login(user)
    click_on "Complete"

    expect(page).to have_content("Task was completed successfully!")
    expect(page).to have_no_content("Some task")
    expect(task.reload).to eq(task)
  end

end