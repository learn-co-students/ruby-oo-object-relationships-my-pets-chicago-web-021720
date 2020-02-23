require_relative 'cat'
require_relative 'dog'

class Owner
  
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
  end

  def say_species
    "I am a #{species}."
  end

  def cats
    Cat.all.select {|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end

  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    dogs.each {|dog| dog.mood = 'happy'}
  end

  def feed_cats
    cats.each {|cat| cat.mood = 'happy'}
  end

  def pets
    dogs + cats
  end

  def sell_pets
    pets.each do |pet| 
      pet.mood = 'nervous'
      pet.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

end