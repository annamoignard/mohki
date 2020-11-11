class Brand < ApplicationRecord
  include Searchable

  belongs_to :user
  has_many :listings
  has_one_attached :picture
  validates :terms_of_service, acceptance: {accept: ["1" , true]}

  scope :search_by_brand, -> (brand) { Brand.where('brands.name ILIKE ?', "%#{brand}%") }
end


# likes table with user_id and a listing_id 
# rails g model Like user:references listing:references 
