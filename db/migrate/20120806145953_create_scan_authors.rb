class CreateScanAuthors < ActiveRecord::Migration
  def self.up
    create_table :scan_authors do |t|
      t.string :name

      t.timestamps
    end

    #Many to many relation
    create_table :scan_authors_volumes, :id => false do |t|
      t.references :scan_author, :volume
    end
    add_index :scan_authors_volumes, [:scan_author_id, :volume_id]

  end

  def self.down
    drop_table :scan_authors_volumes
    drop_table :scan_authors
  end
end
