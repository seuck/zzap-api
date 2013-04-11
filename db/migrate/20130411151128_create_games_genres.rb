class CreateGamesGenres < ActiveRecord::Migration
  def self.up
    create_table :games_genres, :id => false do |t|
      t.references :game
      t.references :genre

      t.timestamps
    end
    add_index :games_genres, :game_id
    add_index :games_genres, :genre_id
  end
  
  def self.down
    drop_table :games_genres
  end
end
