class Api::PublishersController < ApplicationController
  
  respond_to :json

  def index
    @publishers = Publisher.find_all_with_countries
    respond_with_json @publishers
  end
  
  def show
    @publisher = Publisher.find(params[:id])
    respond_with_json @publisher
  end
  
end