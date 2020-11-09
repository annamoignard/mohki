class BrandsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_brand, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  # display all brands, not just the user brand 
  def index
    @brands = Brand.all
  end
  
  def show 
  end 

  def new
    redirect_to root_path unless current_user.brand.nil? #checking if the user has created a brand before
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    @brand.picture.attach(params[:brand][:picture])
    @brand.user = current_user
    if @brand.save 
    # assiging a new instance of a brand to the has_one relationship
    # current_user.brand = @brand #setting up relationship between brand and the user, and giving the brand a user id
    # current_user.save
    redirect_to brand_path(@brand.id) #so they can view the brand that they created
    else  
      render :new 
    end
  end

  def edit
  end

  def update
    @brand.update(name: params[:brand][:name], price_range: params[:brand][:price_range], speciality: params[:brand][:speciality])
    redirect_to brand_path(brand.id)
  end

  def destroy
    @brand.destroy
    #need a flash message in here or something 'are you SURE?'
    redirect_to brands_path
    #successfully deleted (button = home)
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def brand_params
    params.require(:brand).permit(:name, :price_range, :speciality, :terms_of_service)
  end

  def authorize_user! 
    unless @brand.user_id == current_user.id
      flash[:not_authorized] = "Not authorized to access this page!!"
      redirect_to brands_path
    end 
  end 

end
