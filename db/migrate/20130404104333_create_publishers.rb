class CreatePublishers < ActiveRecord::Migration
  def self.up
    create_table :publishers do |t|
      t.string :name, :null => false
      t.references :country

      t.timestamps
    end
    
    add_index :publishers, :country_id
  end
  
  def self.down
    drop_table :publishers
  end
end
