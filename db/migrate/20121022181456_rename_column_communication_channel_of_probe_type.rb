class RenameColumnCommunicationChannelOfProbeType < ActiveRecord::Migration
  def self.up
    rename_column :probe_types, :probe_communication_channel_id, :communication_channel_id
  end

  def self.down
    rename_column :probe_types, :communication_channel_id, :probe_communication_channel_id
  end
end
