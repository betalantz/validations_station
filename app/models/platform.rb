class Platform < ApplicationRecord
  belongs_to :station
  has_many :assignments
  has_many :trains, through: :assignments

  validates :platform_num, numericality: { 
      only_integer: true,
      greater_than: 0,
      less_than_or_equal_to: 20
    }
  validates :platform_num, uniqueness: { scope: :station }
end
