class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :task, null: false
      t.belongs_to :comment
      t.text :body
      t.timestamp :created_at
      t.belongs_to :user, null: false

    end
  end
end
