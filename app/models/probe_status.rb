class ProbeStatus < ActiveRecord::Base
  has_many :events
  attr_accessible :assumed, :name, :status
  
  OK = 1
  WARNING = 2
  ERROR = 3
  ASSUMED_OK = 4
  ASSUMED_WARNING = 5
  ASSUMED_ERROR = 6
  NO_DATA = 7
  UNKNOWN = 8
  
end
