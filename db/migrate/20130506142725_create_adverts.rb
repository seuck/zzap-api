class CreateAdverts < ActiveRecord::Migration
  def self.up
    create_table :adverts do |t|
      t.references :volume, :null => false
      t.references :game, :null => false
      t.references :page, :null => false

      t.timestamps
    end
    add_index :adverts, :volume_id
    add_index :adverts, :game_id
    add_index :adverts, :page_id
  end
  
  def self.down
    drop_table :adverts
  end
end
