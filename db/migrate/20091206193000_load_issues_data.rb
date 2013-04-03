require 'csv'
class LoadIssuesData < ActiveRecord::Migration
  def self.up
    filename = File.join(File.dirname(__FILE__), "data", "issues.csv")
    
    CSV.foreach(filename, :headers => true) do |row|
      Issue.create!(row.to_hash)
    end
  end

  def self.down
    Issue.delete_all
  end
end
