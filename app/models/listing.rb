class Listing < ApplicationRecord
  include Searchable

  enum category: {
    "Body Care": 0,
    "Hair Care": 1, 
    "Skincare": 2, 
    "Make-Up": 3, 
    "Luxury": 4 
  }

  belongs_to :brand
  has_one_attached :picture, dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :price, presence: true
  validates :eco_rating, presence: { message:  "You need to put a number 1 - 5"}


  scope :search_by_category, -> (category) { Listing.where(category: category)}
  scope :search_by_listing, -> (listing) { Listing.where('listings.name ILIKE ?', "%#{listing}%") }

end
