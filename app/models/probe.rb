class Probe < ActiveRecord::Base
  has_many :messages
  belongs_to :probe_type
  belongs_to :customer
  belongs_to :location
  belongs_to :probe_configuration
  attr_accessible :name, :location_coordinates, :enabled, :customer_id, :location_id, :probe_type_id, :cell_number, :probe_configuration_id
end
