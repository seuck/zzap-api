class CreateVolumes < ActiveRecord::Migration
  def self.up
    create_table :volumes do |t|
      t.integer :issue_id
      t.integer :volume_type_id
      t.string :label
      t.integer :pages_number

      t.timestamps
    end

    add_index :volumes, :issue_id
  end

  def self.down
    drop_table :volumes
  end
end
