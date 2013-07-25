class Class

def attr_accessor_with_history(attr_name)		
	attr_name = attr_name.to_s   # make sure it's a string
	attr_reader attr_name        # create the attribute's getter        	
	class_eval "def " + attr_name + "=(value); if(!@history.is_a? Hash); @history = Hash.new; end; if(!@history[:" + attr_name + "].is_a? Array); @history[:" + attr_name + "] = [nil]; end; @history[:" + attr_name + "] << value; @" + attr_name + "=value; end; def " + attr_name + "_history; @history[:" + attr_name + "]; end;"
end

end

class Foo
	attr_accessor_with_history :bar
end