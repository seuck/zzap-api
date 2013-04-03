class CreateIssues < ActiveRecord::Migration
  def self.up
    create_table :issues do |t|
      t.integer :magazine_id
      t.integer :editor_id
      t.integer :sequence
      t.integer :month
      t.integer :year

      t.timestamps
    end

    add_index :issues, :magazine_id
    add_index :issues, :editor_id
  end

  def self.down
    drop_table :issues
  end
end
