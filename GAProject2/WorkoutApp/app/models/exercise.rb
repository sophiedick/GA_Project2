class Exercise < ActiveRecord::Base
  has_and_belongs_to_many :workouts
  has_many :users, through: :workouts

  validates :bodypart, presence: true
  validates :content, presence: true
  validates :comments, presence: true
  
end
