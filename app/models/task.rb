class Task < ActiveRecord::Base

  belongs_to :task_list
  has_many :comments
  belongs_to :user, foreign_key: "assigned_to"
  validates_presence_of :description

  scope :incomplete, -> { where(completed: false) }

end