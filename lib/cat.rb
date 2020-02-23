class Cat
  # code goes here
  @@allcats = []
  attr_accessor :owner,:mood
  attr_reader :name
  def initialize(name,owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@allcats << self
  end
  def self.all
    @@allcats
  end
end
