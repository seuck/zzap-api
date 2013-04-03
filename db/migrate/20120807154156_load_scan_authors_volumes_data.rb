require 'csv'
class LoadScanAuthorsVolumesData < ActiveRecord::Migration
  def self.up
    filename = File.join(File.dirname(__FILE__), "data", "scan_authors_volumes.csv")
    
    CSV.foreach(filename, :headers => true) do |row|
      ScanAuthorsVolume.create!(row.to_hash)
    end
	end

  def self.down
    ActiveRecord::Base.connection.execute("TRUNCATE TABLE scan_authors_volumes")
  end
end
