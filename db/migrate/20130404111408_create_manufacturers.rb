class CreateManufacturers < ActiveRecord::Migration
  def self.up
    create_table :manufacturers do |t|
      t.string :name
      t.references :country, :null => true

      t.timestamps
    end
    add_index :manufacturers, :country_id
  end
  
  def self.down
    drop_table :manufacturers
  end
end
