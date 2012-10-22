class ProbeStatus < ActiveRecord::Base
  has_many :events
  attr_accessible :assumed, :name, :status
end
