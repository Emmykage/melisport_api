class User < ApplicationRecord
    has_many :payments
    belongs_to :shopping_cart
    has_many :user_payments
    has_many :addresses
    belongs_to :order_detail
end
