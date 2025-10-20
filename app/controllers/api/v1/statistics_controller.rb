class Api::V1::StatisticsController < ApplicationController
  before_action :authorize

  def index
    @stat = {
      viewed_orders: Statistic.viewed_orders,
      orders: Statistic.orders,
      messages: Statistic.messages,
      online_orders: Statistic.online_orders,
      offline_orders: Statistic.online_orders
    }
    render json: @stat
  end
end
