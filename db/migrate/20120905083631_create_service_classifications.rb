class CreateServiceClassifications < ActiveRecord::Migration
  def change
    create_table :service_classifications do |t|
      t.string :name
      t.integer :parent_service_classification

      t.timestamps
    end
  end
end
