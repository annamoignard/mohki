class ListingsController < ApplicationController
  # before_action :authenticate_user! 
  before_action :set_listing, only: [:show, :edit, :update, :destroy]

  def index
    @listings = Listing.all
  end
  
  def show 
  end 

  def new
    @listing = Listing.new
  end

  def create
    listing = Listing.new(name: params[:listing][:name], price: params[:listing][:price], eco_rating: params[:listing][:eco_rating])
    listing.save
    listing.picture.attach(params[:listing][:picture])
    redirect_to listing_path(listing.id) #so they can view the listing that they created
  end

  def edit
  end

  def update
    @brand.update(name: params[:listing][:name], price: params[:listing][:price], eco_rating: params[:listing][:eco_rating])
    redirect_to listing_path(listing.id)
  end

  private

  def set_brand
    @listing = Listing.find(params[:id])
  end

  def brand_params
    params.require(:listing).permit(:name, :price, :eco_rating)
  end

end
