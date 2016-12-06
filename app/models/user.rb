class User < ActiveRecord::Base
  # cancancan roles
  ROLES = %w[unconfirmed user manager superadmin]
  
  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  belongs_to :customer
  attr_accessible :name, :customer_id, :email, :mobile_number, :role, :time_zone, :org_unit
  has_many :probes, :foreign_key => :responsible_user_id
  
  after_initialize :set_default_values
  
  def set_default_values
    self.role ||= :user
  end
  
end
