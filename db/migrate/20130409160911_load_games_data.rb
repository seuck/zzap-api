require 'csv'
class LoadGamesData < ActiveRecord::Migration
  def self.up
    filename = File.join(File.dirname(__FILE__), "data", "games.csv")

    CSV.foreach(filename, :headers => true) do |row|
      Game.create!(row.to_hash)
    end
  end

  def self.down
    Game.delete_all
  end
end