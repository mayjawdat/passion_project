class Cat < ActiveRecord::Base
  has_many :renters, through: :orders, source: :user
  belongs_to :order

  # def available?
  #   if @cat[:order_id] == nil
  #     return true
  #   end
  # end

end
