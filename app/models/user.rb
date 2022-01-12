class User < ActiveRecord::Base
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email
  validates :password, presence: true
  #validates_confirmation_of :email_address, :message => "should match confirmation"
end
