class CommunicationChannel < ActiveRecord::Base
  has_many :probe_types
  attr_accessible :name
end
