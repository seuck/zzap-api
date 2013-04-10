class CreateDevelopers < ActiveRecord::Migration
  def self.up
    create_table :developers do |t|
      t.string :name, :null => false
      t.references :country

      t.timestamps
    end
    
    add_index :developers, :country_id
  end
  
  def self.down
    drop_table :developers
  end
end

