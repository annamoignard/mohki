class LikesController < ApplicationController
  before_action :find_listing, only: [:create]
  before_action :find_like, only: [:destroy]

  def index
    @listings = current_user.liked_listings
  end 
  #  logic for creating a like that is associated with a listing, also need to be assoicated
  #  with a current_user, who the like belongs_to 
  def create
    @listing.likes.create(user_id: current_user.id)
    redirect_to listings_path 
  end
  #  user can unlike a listing and then it wont appear in there faves page anymore
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


