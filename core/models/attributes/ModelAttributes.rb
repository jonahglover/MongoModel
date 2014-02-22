#	this class seems a bit redundant, but I wanted to seperate the attributes from the ModelBase because this implementation could change later

class ModelAttributes

#	creates a new hash for the attributes
	def initialize
		@attributes = Hash.new
	end

	#	takes a hash "key, value" pair. Overwrites the entry for the key if it already exists. Returns 1 if new entry, and 2 if overwrite
	def addAttribute(key,value)
		if hasAttribute(key)
			ret = 2
		else
			ret = 1
		end
		@attributes[key] = value
		return ret
	end	

#	checks if key exists in attributes hash
	def hasAttribute(key)
		return @attributes.key?(key)
	end
	
#	removes the attribute from the list, if the key exists. returns 1 if success or 0 if key doesn't exist
	def removeAttribute(key)
		if hasAttribute(key)
			@attributes.delete(key)
			return 1
		else
			return 0
		end
	end
	
#	returns the attribute hash
	def toHash
		return @attributes
	end
	
#	prints the attributes
	def prettyPrint
		puts "{"
		@attributes.each do |key,value|
			puts "	#{key} => #{value}"
		end
		puts "}"
	end
end