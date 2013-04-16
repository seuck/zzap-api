class CreateGameVersions < ActiveRecord::Migration
  def self.up
    create_table :game_versions do |t|
      t.integer :year
      t.references :game, :null => false
      t.references :system
      t.references :media
      t.references :developer

      t.timestamps
    end
    add_index :game_versions, :game_id
    add_index :game_versions, :system_id
    add_index :game_versions, :media_id
    add_index :game_versions, :developer_id
  end
  
  def self.down
    drop_table :game_versions
  end
end
