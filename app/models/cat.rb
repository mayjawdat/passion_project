class Cat < ActiveRecord::Base
  has_many :orders
  has_many :renters, through: :orders, source: :user
end
