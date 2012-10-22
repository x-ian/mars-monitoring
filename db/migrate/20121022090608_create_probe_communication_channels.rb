class CreateCommunicationChannels < ActiveRecord::Migration
  def change
    create_table :communication_channels do |t|
      t.string :name

      t.timestamps
    end
  end
end
