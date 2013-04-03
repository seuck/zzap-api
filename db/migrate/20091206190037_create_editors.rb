class CreateEditors < ActiveRecord::Migration
  def self.up
    create_table :editors do |t|
      t.string :name, :null => false

      t.timestamps
    end
    Editor.create(:name => "Edizioni Hobby S.r.l.")
    Editor.create(:name => "Xenia Edizioni S.r.l.")
  end

  def self.down
    drop_table :editors
  end
end
