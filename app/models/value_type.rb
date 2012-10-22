class ValueType < ActiveRecord::Base
  has_many :events
  has_many :probe_configurations
  attr_accessible :description, :name, :cumulative
end
