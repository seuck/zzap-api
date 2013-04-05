require 'csv'
class LoadGenresData < ActiveRecord::Migration
  def self.up
    filename = File.join(File.dirname(__FILE__), "data", "genres.csv")

    CSV.foreach(filename, :headers => true) do |row|
      Genre.create!(row.to_hash)
    end
  end

  def self.down
    Genre.delete_all
  end
end
