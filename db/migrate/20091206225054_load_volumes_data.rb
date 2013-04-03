require 'csv'
class LoadVolumesData < ActiveRecord::Migration
  def self.up
    filename = File.join(File.dirname(__FILE__), "data", "volumes.csv")
    
    CSV.foreach(filename, :headers => true) do |row|
      Volume.create!(row.to_hash)
    end
  end

  def self.down
    Volume.delete_all
  end
end
