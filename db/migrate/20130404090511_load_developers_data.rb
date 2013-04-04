require 'csv'
class LoadDevelopersData < ActiveRecord::Migration
  def self.up
    filename = File.join(File.dirname(__FILE__), "data", "developers.csv")
  
    CSV.foreach(filename, :headers => true) do |row|
      Developer.create!(row.to_hash)
    end
  end

  def self.down
    Developer.delete_all
  end
end