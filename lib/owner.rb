require 'pry'
class Owner
  @@all = []
  attr_reader :name,:species
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  def say_species
    "I am a human."
  end
  def self.all
    @@all
  end
  def self.count
    @@all.length
  end
  def self.reset_all
    @@all = []
  end
  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end
  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end
  def buy_cat(cat)
    newcat = Cat.new(cat, self)
    newcat
  end
  def buy_dog(dog)
    newdog = Dog.new(dog, self)
    newdog
  end
  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end
  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end
  def sell_pets
    self.dogs.each do |dog|
      dog.mood="nervous"
      dog.owner = nil
    end
    self.cats.each do |cat|
      cat.mood="nervous"
      cat.owner = nil
    end
  end
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end
