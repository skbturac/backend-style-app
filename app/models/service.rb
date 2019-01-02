class Service < ApplicationRecord
  belongs_to :customer
  belongs_to :stylist
  has_many :menus
end
