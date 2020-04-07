class User < ActiveRecord::Base

  has_secure_password 

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip.downcase)
    if user && user.authenticate(password)
      return user 
    else 
      return nil
    end 
  end

  validates :password, presence: true
  validates :password, length: { minimum: 4 }
  validates :password_confirmation, presence: true

  validates :email, presence: true
  validates_uniqueness_of :email
  validates :first_name, presence: true
  validates :last_name, presence: true
  
end
