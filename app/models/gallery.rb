class Gallery

  attr_reader :name, :city
  @@all=[] 

  def initialize(name:, city:)
    @name = name
    @city = city
    @@all<<self 
  end

  def self.all 
    @@all
  end 

  def paintings
    Painting.all.select {|painting| painting.gallery == self}
  end 

  def artists
    paintings.map {|gallery_paintings|gallery_paintings.artist}
  end 

  def most_expensive_painting
    total=paintings.map {|gallery_paintings| gallery_paintings.price}
    total.max 
  end 

end
