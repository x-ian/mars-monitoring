class User < ActiveRecord::Base
  belongs_to :customer
  attr_accessible :name, :customer_id
end
