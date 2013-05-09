class Api::MagazinesController < ApplicationController
  
  respond_to :json
  
  def index
    @magazines = Magazine.find_all_with_issues
    respond_with_json @magazines
  end
  
  # Allowed params:
  # - complete: true for complete data, false for normal data
  def show
    @magazine = Magazine.find(params[:id])
    respond_with_json @magazine
  end
  
end
