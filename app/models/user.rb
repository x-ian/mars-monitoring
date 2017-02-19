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

  belongs_to :customer
  has_many :probes, :foreign_key => :responsible_user_id
  
  after_initialize :set_default_values
  
  def set_default_values
    self.role ||= :user
    self.time_zone = 'Harare'
  end
  
  after_create :send_admin_mail
  def send_admin_mail
    MailNotifier.send_new_user_message(self).deliver_later
  end

end
