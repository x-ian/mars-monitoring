class AddArchivedToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :archived, :boolean
  end
end
