class Cat < ActiveRecord::Base
  has_many :renters, through: :orders, source: :user
  has_one :order

  def available?
    self.order == nil
  end

end
