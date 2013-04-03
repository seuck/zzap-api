class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.integer :volume_id
      t.string :label
      t.integer :sequence
      t.integer :scan_id

      t.timestamps
    end

    add_index :pages, :volume_id
  end

  def self.down
    drop_table :pages
  end
end
