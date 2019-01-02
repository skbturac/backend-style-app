class Stylist < ApplicationRecord
  has_many :services
  has_many :locations
  has_many :customers, through: :services
end
