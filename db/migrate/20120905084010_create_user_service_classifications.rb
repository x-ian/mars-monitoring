class CreateUserServiceClassifications < ActiveRecord::Migration
  def change
    create_table :user_service_classifications do |t|
      t.integer :user_id
      t.integer :service_classification_id

      t.timestamps
    end
  end
end
