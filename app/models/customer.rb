class Customer < ActiveRecord::Base
  has_many :probes
  has_many :locations
end
