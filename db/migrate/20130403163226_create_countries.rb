class CreateCountries < ActiveRecord::Migration
  def self.up
    create_table :countries do |t|
      t.string :name

      t.timestamps
    end
    Country.create(:name => "USA")
    Country.create(:name => "UK")
    Country.create(:name => "Australia")
    Country.create(:name => "Japan")
    Country.create(:name => "Italy")
    Country.create(:name => "Spain")
    Country.create(:name => "France")
    Country.create(:name => "Germany")
  end
  
  def self.down
    drop_table :countries
  end
end
