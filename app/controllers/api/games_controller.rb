class Api::GamesController < ApplicationController
  
  respond_to :json

  def index
    @games = Game.find_all_complete
    respond_with_json @games
  end
  
  def show
    @game = Game.find(params[:id])
    respond_with_json @game
  end
  
end