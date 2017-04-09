class Order < ActiveRecord::Base
  belongs_to :cat
  belongs_to :user
end

