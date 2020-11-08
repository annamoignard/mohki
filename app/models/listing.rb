class Listing < ApplicationRecord
  belongs_to :brand
  has_one_attached :picture
end
