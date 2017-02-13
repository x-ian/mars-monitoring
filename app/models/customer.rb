class Customer < ActiveRecord::Base
  has_many :probes
  has_many :locations
  #attr_accessible :name
end
