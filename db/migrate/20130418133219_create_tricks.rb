class CreateTricks < ActiveRecord::Migration
  def self.up
    create_table :tricks do |t|
      t.references :game_version, :null => false
      t.references :trick_type, :null => false
      t.references :volume, :null => false
      t.references :page, :null => false

      t.timestamps
    end
    add_index :tricks, :game_version_id
    add_index :tricks, :trick_type_id
    add_index :tricks, :volume_id
    add_index :tricks, :page_id
  end
  
  def self.down
    drop_table :tricks
  end
end
