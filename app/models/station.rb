class Station < ApplicationRecord
    has_many :platforms
    validates :name, length: { minimum: 3 }
    validates :name, uniqueness: true
end
