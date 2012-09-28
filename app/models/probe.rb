class Probe < ActiveRecord::Base
  has_many :messages
  has_many :probes_probe_status_configrations
  belongs_to :customer
  belongs_to :location
  belongs_to :service_classification
  attr_accessible :name, :customer_id, :location_id, :location_coordinates, :service_classification_id, :enabled
end
