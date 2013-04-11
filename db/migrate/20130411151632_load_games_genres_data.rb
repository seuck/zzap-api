require 'csv'
class LoadGamesGenresData < ActiveRecord::Migration
  def self.up
    filename = File.join(File.dirname(__FILE__), "data", "games_genres.csv")

    CSV.foreach(filename, :headers => true) do |row|
      GamesGenre.create!(row.to_hash)
    end
  end

  def self.down
    GamesGenre.delete_all
  end
end
