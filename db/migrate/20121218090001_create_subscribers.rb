class CreateSubscribers < ActiveRecord::Migration
  def change
    create_table :subscribers do |t|
      t.string :name
      t.integer :subscriber1_id
      t.integer :subscriber2_id
      t.integer :subscriber3_id
      t.integer :subscriber4_id
      t.integer :subscriber5_id

      t.timestamps
    end
  end
end
