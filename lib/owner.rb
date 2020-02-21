class Owner
  attr_accessor
  attr_reader :name, :species

  @@all = []

  def initialize(name = nil)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all.clear
  end

  def dogs
    Dog.all.find_all { |dog| dog.owner == self }
  end

  def cats
    Cat.all.find_all { |cat| cat.owner == self }
  end

  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.each { |cat| cat.mood = "happy" }
  end

  def sell_pets
    [self.dogs, self.cats].each {
      |pets| pets.each {
        |pet| pet.mood = "nervous"
        pet.owner = nil
      }
    }
  end

  def list_pets
    "I have #{self.dogs.length} dog(s), and #{self.cats.length} cat(s)."
  end

end