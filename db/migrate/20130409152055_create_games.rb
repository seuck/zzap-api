class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.string :name, :null => false
      t.references :publisher
      t.references :setting
      t.references :perspective

      t.timestamps
    end
    add_index :games, :publisher_id
    add_index :games, :setting_id
    add_index :games, :perspective_id
  end
  
  def self.down
    drop_table :games
  end
end
