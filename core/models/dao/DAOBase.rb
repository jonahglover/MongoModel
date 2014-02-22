#	DAO Base will take a model and access the database with it
require_relative './../domain/DomainBase.rb'
require 'mongo'

class DAOBase
	include Mongo
#	make a new DAO for each db connection. require db name for this instance

	def	initialize(name)
		#TODO: get config info from another file
		@dbName		  = name
		@dbConnection = ""
	end

#	tries to connect to the database returns 1 if success or 0 if failure
	def connect
		@db = Connection.new.db(@dbName)
		#WARNING, can't figure out how to test if the connection failed or not so it's success every time
		return 1
	end

#	return an array of models that match the attributes given in the model
	def find(model)
		modelCollection = @db.collection(model.getId)
		if(modelCollection)
			modelHash = model.getAttributes
			if(modelHash)
			# this should return array modelbase, not the mongo response
				retCursor = modelCollection.find(modelHash)

				modelCollectionArray = Array.new

				if(retCursor)
					retCursor.each do |modelAttr|

						retDomain = DomainBase.new

						modelAttr.each do |key,value|
							retDomain.addAttribute(key,value)
							modelCollectionArray.push(retDomain)
						end
						
					end

					return modelCollectionArray

				else
					return 0
				end

			else
				return 0
			end
		else
			return 0
		end
	end	

#	insert a model into the database returns id if success
	def	saveModel(model)
		# connect to model's collection using the name provided by the model
		modelCollection = @db.collection(model.getId)
		if(modelCollection)
			modelHash = model.getAttributes
			if(modelHash)
				modelReturnId = modelCollection.save(modelHash)
				if(modelReturnId)
					return modelReturnId
				else
					return 0
				end
			else
				return 0
			end
		else
			return 0
		end
	end
	
#	this update will work the same way as an sql update 
#	takes the model(s) that look like what you want to update and updates them all

	def	updateModel(model, attributes)
		# connect to model's collection using the name provided by the model
		modelCollection = @db.collection(model.getId)
		if (modelCollection)
			updatedAttributes = {$set => attributes}
			updatedAttributes[multi] = true # without this line it would only update a single record
			modelCollection.update(model.getAttributes, updatedAttributes)
		else
			return 0
		end
	end

end