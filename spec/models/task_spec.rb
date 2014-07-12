require 'rails_helper'

describe Task do

  it 'requires a description to be present' do
    task = Task.new
    expect(task).to have(1).errors_on(:description)
    task.description = "Something"
    expect(task).to have(0).errors_on(:description)
  end

end