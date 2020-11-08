class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end
  
  def show 
  end 

  def new
    @listing = Listing.new
  end

  def create
    listing = Listing.new(name: params[:brand][:name], price_range: params[:brand][:price_range], speciality: params[:brand][:speciality])
    brand.save
    brand.picture.attach(params[:brand][:picture])
    # assiging a new instance of a brand to the has_one relationship
    current_user.brand = brand #setting up relationship between brand and the user, and giving the brand a user id
    redirect_to brand_path(brand.id) #so they can view the brand that they created
  end

  def edit
  end

  def update
    @brand.update(name: params[:brand][:name], price_range: params[:brand][:price_range], speciality: params[:brand][:speciality])
    redirect_to brand_path(brand.id)
  end

end
