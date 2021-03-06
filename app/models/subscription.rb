class Subscription < ActiveRecord::Base
  belongs_to :subscriber1, :class_name => "User"
  belongs_to :subscriber2, :class_name => "User"
  belongs_to :subscriber3, :class_name => "User"
  belongs_to :subscriber4, :class_name => "User"
  belongs_to :subscriber5, :class_name => "User"
  
  def subscribers
    s = []
    s << subscriber1 unless subscriber1.nil?
    s << subscriber2 unless subscriber2.nil?
    s << subscriber3 unless subscriber3.nil?
    s << subscriber4 unless subscriber4.nil?
    s << subscriber5 unless subscriber5.nil?
    return s
  end
  
end
