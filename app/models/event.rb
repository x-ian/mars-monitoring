class Event < ActiveRecord::Base
  belongs_to :value_type
  belongs_to :probe_status
  belongs_to :message
  #attr_accessible :value, :message_id, :probe_status_id, :value_type_id
end
