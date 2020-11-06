class BrandsController < ApplicationController
  before_action :authenticate_user! 

  def show 
  end 

  def new
    @brand = Brand.new
  end

  def create
    brand = current_user.brands.new(name: params[:brand][:name], price_range: params[:brand][:price_range], speciality: params[:brand][:speciality])
    brand.save 
    redirect_to brands_path
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
end
