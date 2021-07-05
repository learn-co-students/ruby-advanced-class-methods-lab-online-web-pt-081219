class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
   @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song
    @@all << new_song
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find { |song|song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
     self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(yup)
  blueleo = yup.split(/\s(-)\s|(.mp3)/)
  song = Song.new
  song.artist_name = blueleo[0]
  song.name = blueleo[2]
  return song
end

  def self.create_from_filename(yup)
  blueleo = yup.split(/\s(-)\s|(.mp3)/)
  song = Song.new
  song.artist_name = blueleo[0]
  song.name = blueleo[2]
  song.save
end
  def self.destroy_all
    self.all.clear
  end
end
