class Level < ApplicationRecord
    has_many :products

    validates :stage, presence: true, uniqueness: true

end
