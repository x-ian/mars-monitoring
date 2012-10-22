class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.float :value
      t.integer :message_id
      t.integer :probe_status_id
      t.integer :value_type_id

      t.timestamps
    end
  end
end
