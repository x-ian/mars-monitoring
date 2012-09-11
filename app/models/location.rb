class Location < ActiveRecord::Base
  has_many :probes
  belongs_to :customer
  attr_accessible :customer_id, :name, :parent_location_id

  def isLeaf?
    Location.find_all_by_parent_location_id(self).empty?
  end
end
