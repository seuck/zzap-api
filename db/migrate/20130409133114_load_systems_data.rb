require 'csv'
class LoadSystemsData < ActiveRecord::Migration
  def self.up
    filename = File.join(File.dirname(__FILE__), "data", "systems.csv")

    CSV.foreach(filename, :headers => true) do |row|
      System.create!(row.to_hash)
    end
  end

  def self.down
    System.delete_all
  end
end
