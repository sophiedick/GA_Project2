class User < ActiveRecord::Base

  has_many :workouts
  has_many :exercises, through: :workouts
 
  validates :email, presence: true, uniqueness: true
  validates :username, uniqueness: true, :length => { :minimum => 5 }

  has_secure_password
  
end
