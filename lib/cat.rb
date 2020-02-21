class Cat

  attr_accessor :mood, :owner
  attr_reader :name

  @@all = []

  def initialize(name = nil, owner = Owner.new("Hermione"))
    @owner = owner
    @name = name
    @mood = "nervous"
    @@all << self
  end

  def self.all
    @@all
  end

  def owner=(owner)
    @owner = owner
  end

end