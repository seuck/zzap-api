require 'csv'
class LoadPublishersData < ActiveRecord::Migration
  def self.up
    filename = File.join(File.dirname(__FILE__), "data", "publishers.csv")

    CSV.foreach(filename, :headers => true) do |row|
      Publisher.create!(row.to_hash)
    end
  end

  def self.down
    Publisher.delete_all
  end
end

