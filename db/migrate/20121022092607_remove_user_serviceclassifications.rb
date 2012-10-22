class RemoveUserServiceclassifications < ActiveRecord::Migration
  def up
    drop_table :user_service_classifications
  end

  def down
    create_table :user_service_classifications do |t|
      t.integer :user_id
      t.integer :service_classification_id

      t.timestamps
    end
  end
end
