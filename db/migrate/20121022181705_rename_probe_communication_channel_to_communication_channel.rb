class RenameProbeCommunicationChannelToCommunicationChannel < ActiveRecord::Migration
  def change
      rename_table :probe_communication_channels, :communication_channels
  end 
end
