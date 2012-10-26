class ValueType < ActiveRecord::Base
  has_many :events
  has_many :probe_types
  attr_accessible :description, :name, :cumulative
  
  NOT_CONFIGURED = 1
  
end
