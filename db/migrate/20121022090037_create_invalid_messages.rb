class CreateInvalidMessages < ActiveRecord::Migration
  def change
    create_table :invalid_messages do |t|
      t.text :content

      t.timestamps
    end
  end
end
