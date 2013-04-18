class Api::GamesController < ApplicationController
  respond_to :json

  def index
    @games = Game.find_all_complete
  end
  
  def show
    if params[:complete] == "true"
      @game = Game.find_complete(params[:id])
      render "showcomplete"
    else
      @game = Game.find_game(params[:id])
    end
  end
  
end