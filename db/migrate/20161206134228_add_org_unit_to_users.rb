class AddOrgUnitToUsers < ActiveRecord::Migration
  def change
    add_column :users, :org_unit, :text
  end
end
