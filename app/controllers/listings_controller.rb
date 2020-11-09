class ListingsController < ApplicationController
  before_action :set_listing, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :check_seller!, only: [:new, :create]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def index
    @listings = Listing.all
  end
  
  def show 
  end 

  def new
    @listing = Listing.new
  end

  def create
    # is this not working coz it is meant to associate with brand? 
    brand = current_user.brand 
    listing = brand.listings.new(name: params[:listing][:name], price: params[:listing][:price], eco_rating: params[:listing][:eco_rating])
    listing.save
    listing.picture.attach(params[:listing][:picture])
    redirect_to listing_path(listing.id) 
  end 

  def edit
    @listing = Listing.find(params[:id])
  end

  def update
    @listing.update(name: params[:listing][:name], price: params[:listing][:price], eco_rating: params[:listing][:eco_rating])
    redirect_to listing_path(listing.id)
  end

  def destroy
    @listing.destroy
    redirect_to listings_path
    #successfully deleted (button = home)
  end

  private

  def set_listing
    id = params[:id]
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listings).permit(:name, :price, :eco_rating)
  end

  def authorize_user! 
    @listing.brand_id == current_user.brand.id
    unless @listing.brand_id
      redirect_to listings_path
    end 
    # the listing has a brand, using the brand to figure out who the owner is. Does the current users brand, match the brand on the listing?
    # if it does, then we continue on. If it returns false, it will stop
    # the action
  end 

  def check_seller!
    unless current_user.seller? 
      redirect_to listings_path
    end 
  end 

end
