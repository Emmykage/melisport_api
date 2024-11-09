class Statistic < ApplicationRecord

    def self.viewed_orders
        OrderDetail.where(viewed: false).count

    end
    def self.orders
        OrderDetail.all.count
    end

    def self.messages
        0
    end

    def self.online_orders
        OrderDetail.count

    end
    def self.offline_orders
        0

    end



end
