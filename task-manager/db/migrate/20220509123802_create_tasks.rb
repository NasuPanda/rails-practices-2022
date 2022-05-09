class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.text :name
      t.text :description
      t.datetime :due_on
      t.boolean :completed
      t.timestamps
    end
  end
end
