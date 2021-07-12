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
    song = Song.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(query)
    @@all.find do |song|
      song.name == query
    end
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name) == nil
      Song.create_by_name(name)
    else
      Song.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    new_array = filename.chomp(".mp3").split(" - ")
    song = Song.create_by_name(new_array[1])
    song.artist_name = new_array[0]
    song
  end

  def self.create_from_filename(filename)
    new_array = filename.chomp(".mp3").split(" - ")
    song = Song.create_by_name(new_array[1])
    song.artist_name = new_array[0]
    song
  end

  def self.destroy_all
    @@all.clear
  end
end
