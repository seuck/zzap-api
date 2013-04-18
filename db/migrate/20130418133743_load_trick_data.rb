require 'csv'
class LoadTrickData < ActiveRecord::Migration
  def self.up
    filename = File.join(File.dirname(__FILE__), "data", "tricks.csv")

    CSV.foreach(filename, :headers => true) do |row|
      Trick.create!(row.to_hash)
    end
  end

  def self.down
    Trick.delete_all
  end
end
