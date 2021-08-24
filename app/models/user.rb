class User < ActiveRecord::Base
  has_secure_password
  
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }
  
  def self.authenticate_with_credentials(user_email, user_password)
    @user = User.find_by email: user_email 
    if @user && @user.authenticate(user_password)
      @user
    else
      nil
    end
  end

end