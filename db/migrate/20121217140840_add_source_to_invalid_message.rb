class AddSourceToInvalidMessage < ActiveRecord::Migration
  def change
    add_column :invalid_messages, :source, :string
  end
end
