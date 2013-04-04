class CreateDevelopers < ActiveRecord::Migration
  def self.up
    create_table :developers do |t|
      t.string :name
      t.references :country, :null => true

      t.timestamps
    end
    
    add_index :developers, :country_id
  end
  
  def self.down
    drop_table :developers
  end
end

