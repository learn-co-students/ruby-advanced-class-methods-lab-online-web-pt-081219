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
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    #accepts string name of a song
    #returns the matching instance of the song with that name
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by {|n| n.name}
  end

  def self.new_from_filename(filename)
    #taking the artist name and song name from filename in the format of ("artist_name - song_name.mp3")
    song = self.create
    song.name = filename.split(" - ")[1].delete_suffix(".mp3")
    song.artist_name = filename.split(" - ")[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end
end
