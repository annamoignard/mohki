class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
  has_one :brand
  has_many :likes
  has_many :liked_listings, through: :likes, class_name: "Listing", source: :listing
  # validates_associated :brand 
  validates :username, presence: true, uniqueness: true
end
