class LikesController < ApplicationController
  before_action :find_listing, only: [:create]
  before_action :find_like, only: [:destroy]

  def index
    @likes = Like.where(user_id: current_user.id)
  end 

  def create
    @listing.likes.create(user_id: current_user.id)
    redirect_to listings_path 
  end

  def destroy
    # if !(already_liked?)
    #   flash[:notice] = "Cannot unlike"
    # else
      @like.destroy
    # end
    redirect_to listings_path
  end

  private

  def find_listing
    @listing = Listing.find(params[:listing_id])
  end

  def find_like
    @like = @listing.likes.find(params[:id])
  end

  # def already_liked?
  #   Like.where(user_id: current_user.id, listing_id:
  #   params[:listing_id]).exists?
  # end

end


# need to add route? done this 
# need a view page for user to view liked products? done 
# associations are wrong - join table ????  done 
# is it product or listing? I guess listing coz i am 'liking' the listing 
# only someone logged in can like 
