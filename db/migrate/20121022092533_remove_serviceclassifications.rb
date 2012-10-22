class RemoveServiceclassifications < ActiveRecord::Migration
  def up
    drop_table :service_classifications
  end

  def down
    create_table :service_classifications do |t|
      t.string :name
      t.integer :parent_service_classification

      t.timestamps
    end
  end
end
