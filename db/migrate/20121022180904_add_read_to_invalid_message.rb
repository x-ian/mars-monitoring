class AddReadToInvalidMessage < ActiveRecord::Migration
  def change
    add_column :invalid_messages, :read, :boolean
  end
end
