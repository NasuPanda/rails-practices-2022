class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :published_on
      t.string :date
      t.integer :price

      t.timestamps
    end
  end
end
