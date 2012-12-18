class Subscription < ActiveRecord::Base
  belongs_to :subscriber1, :class_name => "User"
  belongs_to :subscriber2, :class_name => "User"
  belongs_to :subscriber3, :class_name => "User"
  belongs_to :subscriber4, :class_name => "User"
  belongs_to :subscriber5, :class_name => "User"
  attr_accessible :name, :subscriber1_id, :subscriber2_id, :subscriber3_id, :subscriber4_id, :subscriber5_id
end
