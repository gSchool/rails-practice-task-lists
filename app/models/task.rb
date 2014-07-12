class Task < ActiveRecord::Base

  belongs_to :task_list
  validates_presence_of :description

  scope :incomplete, -> { where(completed: false) }

end