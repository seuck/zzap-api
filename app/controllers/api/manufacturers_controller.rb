class Api::ManufacturersController < ApplicationController
  
  respond_to :json

  def index
    @manufacturers = Manufacturer.find_all_with_countries
    respond_with_json @manufacturers
  end
  
  def show
    @manufacturer = Manufacturer.find(params[:id])
    respond_with_json @manufacturer
  end
  
end