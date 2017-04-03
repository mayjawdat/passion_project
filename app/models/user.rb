require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_many :orders

  validates :email, :hashed_password, presence: true
  validates :email, uniqueness: true

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @password ||= Password.create(new_password)
    self.hashed_password = @password
  end

  def authenticate(password_input)
    self.password == password_input
  end

end
