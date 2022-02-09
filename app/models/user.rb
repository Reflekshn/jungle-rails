class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, presence: true

  def self.authenticate_with_credentials(email, password)
    @user = User.find_by_email(email.downcase.strip)
    @user && @user.authenticate(password)
  end
end
