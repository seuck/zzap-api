require 'csv'
class LoadReviewData < ActiveRecord::Migration
  def self.up
    filename = File.join(File.dirname(__FILE__), "data", "reviews.csv")

    CSV.foreach(filename, :headers => true) do |row|
      Rails.logger.debug "row: #{row.to_hash}"
      Review.create!(row.to_hash)
    end
  end

  def self.down
    Review.delete_all
  end
end
