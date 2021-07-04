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

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new 
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    @@all.find {|song_name| song_name.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
       self.find_by_name(name) 
    else self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.new_from_filename(file_name)
    song = Song.new 
    song.name = (file_name.split(" - ")[1].chomp(".mp3"))
    song.artist_name = file_name.split(" - ")[0]
    song
  end
  
  def self.create_from_filename(file_name)
    new_song = self.new_from_filename(file_name)
    @@all << new_song
  end

  def self.destroy_all
    @@all.clear
  end


end
