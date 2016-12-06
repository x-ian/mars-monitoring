class AddResponsibleUserIdToProbes < ActiveRecord::Migration
  def change
    add_column :probes, :responsible_user_id, :integer
  end
end
