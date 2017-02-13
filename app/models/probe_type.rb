class ProbeType < ActiveRecord::Base
  belongs_to :communication_channel
  has_many :probes
  belongs_to :value1_type, :class_name => "ValueType"
  belongs_to :value2_type, :class_name => "ValueType"
  belongs_to :value3_type, :class_name => "ValueType"
  belongs_to :value4_type, :class_name => "ValueType"
  belongs_to :value5_type, :class_name => "ValueType"
  belongs_to :value6_type, :class_name => "ValueType"
  belongs_to :value7_type, :class_name => "ValueType"
  belongs_to :value8_type, :class_name => "ValueType"
  belongs_to :value9_type, :class_name => "ValueType"
  belongs_to :value10_type, :class_name => "ValueType"
  belongs_to :value11_type, :class_name => "ValueType"
  belongs_to :value12_type, :class_name => "ValueType"
  belongs_to :value13_type, :class_name => "ValueType"
  belongs_to :value14_type, :class_name => "ValueType"
  belongs_to :value15_type, :class_name => "ValueType"
  belongs_to :value16_type, :class_name => "ValueType"
  #attr_accessible :description, :name, :value1_type_id, :value2_type_id, :value3_type_id, :value4_type_id, :value5_type_id, :value6_type_id, :value7_type_id, :value8_type_id, :value9_type_id, :value10_type_id, :value11_type_id, :value12_type_id, :value13_type_id, :value14_type_id, :value15_type_id, :value16_type_id, :communication_channel_id
end
