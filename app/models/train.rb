class Train < ApplicationRecord
    has_many :assignments
    has_many :platforms, through: :assignments

    validates :origin, :destination, length: { in: 3..20 }
    validates :is_express, inclusion: [true, false]

end
