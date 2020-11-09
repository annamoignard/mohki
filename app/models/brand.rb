class Brand < ApplicationRecord
  belongs_to :user
  has_many :listings
  has_one_attached :picture
  validates :terms_of_service, acceptance: {accept: ["1" , true]}
end
