class ServiceClassification < ActiveRecord::Base
  has_many :probes
  attr_accessible :name, :parent_service_classification_id
  
  def isLeaf?
    ServiceClassification.find_all_by_parent_service_classification_id(self).empty?
  end
end
