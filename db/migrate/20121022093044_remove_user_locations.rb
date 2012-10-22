class RemoveUserLocations < ActiveRecord::Migration
  def up
    drop_table :user_locations
  end

  def down
    create_table :user_locations do |t|
      t.integer :user_id
      t.integer :location_id

      t.timestamps
    end
  end
end
