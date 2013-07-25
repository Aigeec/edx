class Numeric
  @@currencies = {'dollar' => 1, 'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019}  
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)      
      self * @@currencies[singular_currency]
    else
      super
    end
  end
  
  def in(currency)
  	singular_currency = currency.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    end    	
  end
end

class String
  # YOUR CODE HERE  
  def palindrome?
  	self.gsub(/\W/, "").downcase.reverse == self.gsub(/\W/, "").downcase  
  end  
end

module Enumerable
  # YOUR CODE HERE
  def palindrome?
  	if(self.respond_to?('to_a'))
    	self.to_a.reverse == self.to_a
    end
  end  
end

puts [1,2,3,2,1].palindrome?
puts [:a=>'x',:b=>'c',:y=>'x'].palindrome?
puts (1..2).palindrome?