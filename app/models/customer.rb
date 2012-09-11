class Customer < ActiveRecord::Base
  has_many :probes
  attr_accessible :name
end
