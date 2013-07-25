def combine_anagrams(words)  
 # YOUR CODE HERE
 groups = Hash.new
 words.each do |w| 	 
	groupName = w.downcase.chars.sort.join
	if (groups[groupName]) 
		groups[groupName].push(w)
	else
		groups[groupName] = Array.new
		groups[groupName].push(w)
	end
 end
 groups.values
end

puts combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream'])
