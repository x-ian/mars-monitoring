class Location < ActiveRecord::Base
  has_many :probes
  belongs_to :customer
  attr_accessible :name, :parent_location_id, :customer_id

  def isLeaf?
    Location.find_all_by_parent_location_id(self).empty?
  end
end
