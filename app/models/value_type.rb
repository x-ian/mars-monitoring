class ValueType < ActiveRecord::Base
  has_many :events
  has_many :probe_types
  
  NOT_CONFIGURED = 1
  
end
