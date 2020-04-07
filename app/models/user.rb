class User < ActiveRecord::Base

  has_secure_password 

  def authenticate_with_credentials
    
  end

  validates :password, presence: true
  validates :password, length: { minimum: 4 }
  validates :password_confirmation, presence: true

  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  
end
