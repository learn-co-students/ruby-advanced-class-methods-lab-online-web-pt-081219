require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
  song = self.new
  @@all << song
  song 
  end 

  def self.new_by_name(title)
    song = self.new
    song.name = title 
    song
  end

  def self.create_by_name(title)
  song = self.create 
  song.name = title
  song 
  end 

  def save
    self.class.all << self
  end
  
  def self.find_by_name(title)
    @@all.find {|song| song.name == title}
  end

  def self.find_or_create_by_name(title)
    self.find_by_name(title) or self.create_by_name(title)
  end

  def self.alphabetical
    #self.all.sort_by {|song| song.name}
    self.all.sort_by(&:name)
  end 

  def self.new_from_filename(file)
    file_split = file.split(" - ")
    artist_name = file_split[0]
    name = file_split[1].gsub(/(.mp3)/,"")
    song = self.new
    song.name = name
    song.artist_name = artist_name
    song
  end

  def self.create_from_filename(file)
    file_split = file.split(" - ")
    artist_name = file_split[0]
    name = file_split[1].gsub(/(.mp3)/,"")
    song= self.new
    @@all << song 
    song.name = name 
    song.artist_name = artist_name
    song 
  end 

  def self.destroy_all
    @@all.clear
  end 
end