#	basic skeleton model class. add and attribute or remove it. hopefully this won't need to change much
require_relative './../attributes/ModelAttributes.rb'

class DomainBase 

	def initialize
#		@attributes is an object full of the model attributes for the database
		@attributes = ModelAttributes.new
#		model id is important for the dao
		@id = ""
	end
	
	def setAttributes(newAttributes)
		@attributes = newAttributes
	end
#	takes a hash "key,value" pair. Overwrites the entry for the key if it already exists. Returns 1 if new entry, and 2 if overwrite	
	def addAttribute(key, value)
		return @attributes.addAttribute(key,value)
	end

#	takes a key and see if it exists in given attribute object
	def hasAttribute(key)
		return @attributes.hasAttribute(key)
	end
	
#	takes a key and if it exists, deletes the key and value from the attributes. Returns 1 if successful, 2 if key doesn't exist
	def removeAttribute(key)
		return @attributes.removeAttribute(key)
	end

#	sets model id
	def setId(modelId)
		@id = modelId
	end

#	returns model id
	def getId
		return @id
	end
	
#	returns model id
	def getAttributes
		return @attributes.toHash
	end
	
#	prints out the attributes like "{key} : {value}"
	def prettyPrint
		@attributes.prettyPrint
	end
	
end