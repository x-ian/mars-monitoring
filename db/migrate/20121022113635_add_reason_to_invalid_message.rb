class AddReasonToInvalidMessage < ActiveRecord::Migration
  def change
    add_column :invalid_messages, :reason, :text
  end
end
