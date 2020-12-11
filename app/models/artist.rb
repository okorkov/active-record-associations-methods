class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_genre_of_first_song
    Genre.find(Song.all.first[:genre_id])
  end

  def song_count
    artist = Song.all.map {|song| song[:artist] == self}
    artist.count
  end

  def genre_count
    #return the number of genres associated with the artist
    genre = Song.all.map {|song| song[:genre] == self}
    genre.count
  end
end
