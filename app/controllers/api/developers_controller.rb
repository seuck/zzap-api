class Api::DevelopersController < ApplicationController
  respond_to :json
  
  def index
    @developers = Developer.find_all_with_countries
    respond_with_json @developers
  end
  
  def show
    @developer = Developer.find(params[:id])
    respond_with_json @developer
  end
end
