class BrandsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_brand, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def show 
  end 

  def new
    redirect_to root_path unless current_user.brand.nil? #checking if the user has created a brand before
    @brand = Brand.new
  end

  def create
    brand = Brand.new(name: params[:brand][:name], price_range: params[:brand][:price_range], speciality: params[:brand][:speciality])
    brand.save
    brand.picture.attach(params[:brand][:picture])
    # assiging a new instance of a brand to the has_one relationship
    current_user.brand = brand #setting up relationship between brand and the user, and giving the brand a user id
    redirect_to brand_path(brand.id) #so they can view the brand that they created
  end

  # def edit
  # end

  # def update
  #   @brand.update(name: params[:brand][:name], price_range: params[:brand][:price_range], speciality: params[:brand][:speciality])
  #   redirect_to brands_path 
  # end

  def destroy
    @brand.destroy
    #need a flash message in here or something 'are you SURE?'
    # redirect_to successfully deleted (button = home)
  end

  private

  def set_brand
    @brand = Brand.find(params[:id])
  end

  def authorize_user! 
    @brand.user_id == current_user.id
  end 
end
