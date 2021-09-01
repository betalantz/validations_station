class Platform < ApplicationRecord
  belongs_to :station
  has_many :assignments
  has_many :trains, through: :assignments

  
end
