require 'csv'
class LoadGameVersionsData < ActiveRecord::Migration
  def self.up
    filename = File.join(File.dirname(__FILE__), "data", "game_versions.csv")

    CSV.foreach(filename, :headers => true) do |row|
      GameVersion.create!(row.to_hash)
    end
  end

  def self.down
    GameVersion.delete_all
  end
end
