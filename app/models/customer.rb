class Customer < ApplicationRecord
  has_many :services
  has_many :locations
  has_many :stylists, through: :services  
end
