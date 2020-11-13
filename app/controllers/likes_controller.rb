class LikesController < ApplicationController
  before_action :find_listing, only: [:create]
  before_action :find_like, only: [:destroy]

  def index
    @listings = current_user.liked_listings
  end 

  def create
    @listing.likes.create(user_id: current_user.id)
    redirect_to listings_path 
  end

  def destroy
    @like.destroy
    redirect_to listings_path
  end

  private

  def find_listing
    @listing = Listing.find(params[:listing_id])
  end

  def find_like
    @like = Like.where(user_id: current_user.id, listing_id: params[:id]).first 
  end

end


