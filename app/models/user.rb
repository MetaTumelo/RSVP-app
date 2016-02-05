class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :validatable
  has_many :guests
  has_many :plusones, through: :guests
  has_one :detail, through: :guests
  

end
