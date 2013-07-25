class CartesianProduct 
	include Enumerable
  # YOUR CODE HERE    
  def initialize(a, b)  	
    @product = []
  	a.each do |x| b.each do |y| @product.push([x,y]) end end	
  end  
  
  def each(&block)
  	@product.each(&block)
  end
  
end

c = CartesianProduct.new([:a,:b], [4,5])
c.each { |elt| puts elt.inspect }
# [:a, 4]
# [:a, 5]
# [:b, 4]
# [:b, 5]

c = CartesianProduct.new([:a,:b], [])
c.each { |elt| puts elt.inspect }