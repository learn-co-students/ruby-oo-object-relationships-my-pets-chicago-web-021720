require_relative 'cat.rb'
require_relative 'dog.rb'

class Owner
  attr_accessor :cats, :dogs
  attr_reader :name, :species
  @@all = []
  @@count = 0

  def initialize(name = nil)
    @name = name
    @species = "human"
    @@all << self
    @@count += 1
    @cats = []
    @dogs = []

  end

  def say_species
    "I am a #{@species}." 
  end

  def self.all
    @@all
  end 

  def self.count
    @@count
  end

  def self.reset_all
    @@count = 0
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

  def buy_cat(name)
    new_cat = Cat.new(name, self)
    @cats << new_cat

  end 

  def buy_dog(name)
    new_dog = Dog.new(name, self)
    @dogs << new_dog
  end 

  def walk_dogs
    self.dogs.map do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.map do |cat|
      cat.mood = "happy"
    end
  end 

  def sell_pets
    self.dogs.map do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.map do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end


  end

  def list_pets
    bark = self.dogs.length
    meow = self.cats.length 
    "I have #{bark} dog(s), and #{meow} cat(s)."
  end 

end




#    #walk_dogs
#      walks the dogs which makes the dogs' moods happy (FAILED - 7)
#    #feed_cats
#      feeds cats which makes the cats' moods happy (FAILED - 8)
#    #sell_pets
#      can sell all its pets, which makes them nervous (FAILED - 9)
#      can sell all its pets, which leaves them without an owner (FAILED - 10)
#    #list_pets
#      can list off its pets (FAILED - 11)


