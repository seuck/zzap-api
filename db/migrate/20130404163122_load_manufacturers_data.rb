require 'csv'
class LoadManufacturersData < ActiveRecord::Migration
  def self.up
    filename = File.join(File.dirname(__FILE__), "data", "manufacturers.csv")

    CSV.foreach(filename, :headers => true) do |row|
      Manufacturer.create!(row.to_hash)
    end
  end

  def self.down
    Manufacturer.delete_all
  end
end