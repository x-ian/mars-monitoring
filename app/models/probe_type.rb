class ProbeType < ActiveRecord::Base
  belongs_to :communication_channel
  has_many :probes
  belongs_to :value1_type, :class_name => "ValueType"
  belongs_to :value2_type, :class_name => "ValueType"
  belongs_to :value3_type, :class_name => "ValueType"
  belongs_to :value4_type, :class_name => "ValueType"
  attr_accessible :description, :name, :value1_type_id, :value2_type_id, :value3_type_id, :value4_type_id, :communication_channel_id
end
