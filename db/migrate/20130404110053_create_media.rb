class CreateMedia < ActiveRecord::Migration
  def self.up
    create_table :media do |t|
      t.string :name, :null => false
      t.string :path

      t.timestamps
    end
    
    Media.create(:name => 'Disk 5,25"', :path => 'disk')
    Media.create(:name => 'Cassette', :path => 'cassette')
    Media.create(:name => 'Arcade Board')
    Media.create(:name => 'Disk 3,5"')
    Media.create(:name => 'Cartridge')
  end
  
  def self.down
    drop_table :media
  end
end
