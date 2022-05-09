class AddUserIdToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :user, foreign_key: true
    change_column :tasks, :user_id, :integer, null: false
  end
end
