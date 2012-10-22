class InvalidMessage < ActiveRecord::Base
  attr_accessible :content, :reason, :read
end
