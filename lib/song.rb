class Song
  Song.find_or_create_by_name("Blank Space")
  song = Song.create
  Song.all.include?(song)
  attr_accessor :name, :artist_name
  @@all = ["The Middle"]

  def self.all
    @@all = name("The Middle")
  end

  def save
    self.class.all << self
  end

end
