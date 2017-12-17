class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = new_by_name(name)
    @@all << song
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    @@all.select { |song| song.name == name }.first
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) unless find_by_name(name) == nil
    create_by_name(name) 
  end
end
