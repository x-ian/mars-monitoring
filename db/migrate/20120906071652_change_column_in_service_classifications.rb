class ChangeColumnInServiceClassifications < ActiveRecord::Migration
  def change
      rename_column :service_classifications, :parent_service_classification, :parent_service_classification_id
  end
end
