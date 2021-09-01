class Train < ApplicationRecord
    has_many :assignments
    has_many :platforms, through: :assignments
end
