class Brand < ApplicationRecord
  belongs_to :user
  has_many :listings
  has_one_attached :picture
end
