class ProbesProbeStatusConfigration < ActiveRecord::Base
  belongs_to :probe
  belongs_to :probe_status_configuration
  attr_accessible :probe_id, :probe_status_configuration_id
end
