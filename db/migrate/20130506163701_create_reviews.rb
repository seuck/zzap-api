class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.references :game_version, :null => false
      t.references :volume, :null => false
      t.references :page, :null => false
      t.integer :vote

      t.timestamps
    end
    add_index :reviews, :game_version_id
    add_index :reviews, :volume_id
    add_index :reviews, :page_id
  end
  
  def self.down
    drop_table :reviews
  end
end
