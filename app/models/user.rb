class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  attr_protected :is_admin
  
  has_many :posts
  
  def is_admin?
    is_admin
  end
end
