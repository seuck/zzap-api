require 'csv'
class LoadScanAuthorsData < ActiveRecord::Migration
  def self.up
    filename = File.join(File.dirname(__FILE__), "data", "scan_authors.csv")
    
    CSV.foreach(filename, :headers => true) do |row|
      ScanAuthor.create!(row.to_hash)
    end
  end

  def self.down
    ScanAuthor.delete_all
  end
end
