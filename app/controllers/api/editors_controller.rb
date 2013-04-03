class Api::EditorsController < ApplicationController
  
  respond_to :json

  def index
    @editors = Editor.find_all_ordered
    respond_with_json @editors
  end
  
  def show
    @editor = Editor.find(params[:id])
    respond_with_json @editor
  end
  
end