class Dessert
  attr_accessor :name, :calories
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  
  def healthy?
    # YOUR CODE HERE
    @calories < 200
  end
  
  def delicious?
    # YOUR CODE HERE
    true
  end
  
  def to_s
  	"Is " + @name + " healthy? " + self.healthy?.to_s + " delicious? " + self.delicious?.to_s
  end
end

class JellyBean < Dessert
	attr_accessor :flavor
	def initialize(name, calories, flavor)
	# YOUR CODE HERE
	super(name, calories)
	@flavor = flavor;
	end

	def delicious?
		if(@flavor == "black licorice")
			false
		else
			super
		end
	end
end

test1 = Dessert.new("Test1", 201)
puts test1

test2 = Dessert.new("Test2", 199)
puts test2

test3 = JellyBean.new("Test2", 199, "black licorice")
puts test3

test4 = JellyBean.new("Test4", 199, "popcorn")
puts test4
