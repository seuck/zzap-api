class CreateTricks < ActiveRecord::Migration
  def self.up
    create_table :tricks do |t|
      t.references :game_version
      t.references :trick_type
      t.references :volume
      t.references :page

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
