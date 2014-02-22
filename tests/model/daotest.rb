require_relative './../../models/domain/DomainBase.rb'
require_relative './../../models/dao/DAOBase.rb'

# create a model, add some attributes
myModel = DomainBase.new
myModel.setId("People")
myModel.addAttribute("name","jonah")
myModel.addAttribute("age","19")

#myModel.prettyPrint

myDao = DAOBase.new("test")

myDao.connect

##

myDao.saveModel(myModel)

myDao.find(myModel)

myModel2 = DomainBase.new
myModel2.setId("People")
myModel2.addAttribute("name","jason")
myModel2.addAttribute("age","19")

myDao.saveModel(myModel2)

myModel3 = DomainBase.new
myModel3.setId("People")
myModel3.addAttribute("age","19")

arr = myDao.find(myModel3)
arr.each do |attr|
	attr.prettyPrint
end