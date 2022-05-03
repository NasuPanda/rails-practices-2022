class CreatePublishers < ActiveRecord::Migration[6.0]
  def change
    create_table :publishers do |t|
      t.text :address

      t.timestamps
    end
  end
end
