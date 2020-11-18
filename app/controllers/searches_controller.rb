class SearchesController < ApplicationController

  def index
    @brands = Brand.search_by_brand(params[:search][:search])
    @listings = Listing.search_by_listing(params[:search][:search])
  end
#  dual search feature implemented via this controller for listings and brands
end
