require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #this is the same as Song.create
    song = self.new
    self.all << song #this is the same as Song.all
    song
  end

  def self.new_by_name(name)
    # binding.pry
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    # song = self.new ##this won't pass the test why?
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    # this works as well
    # if self.find_by_name(name) == nil
    #   self.create_by_name(name)
    # else
    #   self.find_by_name(name)
    # end
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by {|word| word.name}
      # binding.pry
  end

  def self.new_from_filename(filename)
    song_array = filename.split(" - ")
    song_array[1] = song_array[1].chomp(".mp3")
    song = self.new
    song.name = song_array[1]
    song.artist_name = song_array[0]
    song
    # binding.pry
  end

  def self.create_from_filename(filename)
    result = self.new_from_filename(filename)
    song = self.create
    song.name = result.name
    song.artist_name = result.artist_name
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
