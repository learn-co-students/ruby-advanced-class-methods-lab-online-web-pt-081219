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
    song = self.new
    song.save
    return song
  end
  
  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end
  
  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    return song
  end
  
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  
  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end
  
  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end
  
  def self.new_from_filename(file_name)
    info = file_name.split(" - ")

    artist_name = info[0]
    name = info[1].split(".mp3")[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    
    song
  end
  
  def self.create_from_filename(file_name)
    info = file_name.split(" - ")

    artist_name = info[0]
    name = info[1].split(".mp3")[0]
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song.save
    song
  end
  
  def self.destroy_all
  end
  
  
end

filename = "Taylor Swift - Blank Space.mp3"
song = Song.new_from_filename("Taylor Swift - Blank Space.mp3")

puts song.name
puts song.artist_name
