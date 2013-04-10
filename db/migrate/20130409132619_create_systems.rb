class CreateSystems < ActiveRecord::Migration
  def self.up
    create_table :systems do |t|
      t.string :name, :null => false
      t.references :manufacturer

      t.timestamps
    end
    add_index :systems, :manufacturer_id
  end
  
  def self.down
    drop_table :systems
  end
end
