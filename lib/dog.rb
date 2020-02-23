class Dog
  # code goes here
  @@alldogs = []
  attr_accessor :owner, :mood
  attr_reader :name
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@alldogs << self
  end
  def self.all
    @@alldogs
  end

end
