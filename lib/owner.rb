class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name=nil, species = 'human')
    @name = name
    @species = species
    @@all << self
  end
  # code goes here
  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count 
    @@all.count 
  end

  def self.reset_all
    @@all.clear
  end

  def cats 
    my_cats = []
    for i in Cat.all
      if i.owner == self
        my_cats.push(i)
      end
    end
    my_cats
  end

  def dogs 
    my_dogs = []
    for i in Dog.all
      if i.owner == self
        my_dogs.push(i)
      end
    end
    my_dogs
  end

  def buy_cat(name)
    cat = Cat.new(name, self)
  end

  def buy_dog(name)
    dog = Dog.new(name, self)
  end 

  def walk_dogs
    for i in self.dogs
      i.mood = 'happy'
    end
  end

  def feed_cats 
    self.cats.each do |cat|
      cat.mood = 'happy'
    end
  end

  def sell_pets
    self.dogs.each do |dog|
      dog.mood = 'nervous'
      dog.owner = nil
    end 
    self.cats.each do |cat|
      cat.mood = 'nervous'
      cat.owner = nil
    end
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end

end