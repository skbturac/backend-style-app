class Location < ApplicationRecord
  belongs_to :stylist
  belongs_to :customer

end
