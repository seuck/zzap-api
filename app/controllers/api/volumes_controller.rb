class Api::VolumesController < ApplicationController
  respond_to :json
  
  def show
    # find :first returns null if record not found
    @volume = Volume.find_for_api(params) if params[:id]
    respond_with_json @volume
  end
 
  def rabl
    # find :first returns null if record not found
    @volume = Volume.find_for_api(params) if params[:id]
  end 
end
