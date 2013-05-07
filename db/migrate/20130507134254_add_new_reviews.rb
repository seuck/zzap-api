class AddNewReviews < ActiveRecord::Migration
  def up
    # Barbarian - Psygnosis - game ID = 542
    # Note: there are two Barbarian games: 542 and 1092
    
    # C64 cassete and disk
    review = Review.new
    review.game_version_id = 1312
    review.volume_id = 27
    review.page_id = 2093
    review.vote = 79
    review.save

    review = Review.new
    review.game_version_id = 1313
    review.volume_id = 27
    review.page_id = 2093
    review.vote = 79
    review.save
    
    # Spectrum
    review = Review.new
    review.game_version_id = 4183
    review.volume_id = 27
    review.page_id = 2093
    review.vote = 79
    review.save
    
    # Amiga
    review = Review.new
    review.game_version_id = 4092
    review.volume_id = 15
    review.page_id = 1140
    review.vote = 81
    review.save
    
    # Add Atari ST (id = 16) game version, same review than Amiga,
    # and check correctness of game versions and reviews of the other Barbarian game.

    # Atari ST
    #review = Review.new
    #review.game_version_id = ?
    #review.volume_id = 15
    #review.page_id = 1140
    #review.vote = 81
    #review.save
        
  end

  def down
  end
end
