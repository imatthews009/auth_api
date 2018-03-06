class User < ApplicationRecord
  #Knock makes one assumption about your user model: It must have an authenticate method, similar to the one added by has_secure_password.
  has_secure_password
  
  # Password validation.
  validates_length_of       :password, maximum: 72, minimum: 8, allow_nil: true, allow_blank: false
  validates_confirmation_of :password, allow_nil: true, allow_blank: false

  before_validation { 
    (self.email = self.email.to_s.downcase) && (self.username = self.username.to_s.downcase) 
  }

  # email and username are present and unique.
  validates_presence_of     :email
  # validates_presence_of     :username
  validates_uniqueness_of   :email
  validates_uniqueness_of   :username

  # Check if a user has permission to modify. If user is admin or if it's the current user.
  def can_modify_user?(user_id)
    role == 'admin' || id.to_s == user_id.to_s
  end

  def is_admin?
    role == 'admin'
  end
end
