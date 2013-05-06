require 'csv'
class LoadAdvertData < ActiveRecord::Migration
  def self.up
    filename = File.join(File.dirname(__FILE__), "data", "adverts.csv")

    CSV.foreach(filename, :headers => true) do |row|
      Advert.create!(row.to_hash)
    end
  end

  def self.down
    Advert.delete_all
  end
end