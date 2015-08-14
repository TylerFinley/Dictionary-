require('sinatra')
require('sinatra/reloader')
also_reload('./lib/**/*.rb')
require('./lib/dictionaries')
require("./lib/word")


############
#Dictionary Class
############

get('/') do
  @dictionaries = Dictionary.all()
  erb(:index)
end

get('/dictionaries/new') do
  erb(:dictionaries_form)
end

post("/") do
  definition = params.fetch("definition")
  Dictionary.new({:definition => definition}).save()
  @dictionaries = Dictionary.all()
  erb(:index)
end

get("/dictionaries/:id") do
  @dictionary = Dictionary.find(params.fetch("id").to_i())
  erb(:dictionary)
end


############
#Word Class
############

get("/dictionaries/:id/word/new")do
  @dictionary = Dictionary.find(params.fetch('id').to_i())
  @word = Word.find(params.fetch("id").to_i())
  erb(:word_form)
end

post('/dictionaries') do
  word_address = params.fetch("word_address")
  word = Word.new({:word_address => word_address})
  @dictionary = Dictionary.find(params.fetch("dictionary_id").to_i())
  @dictionary.add_word(word)
  erb(:dictionary)
end


################
#Clear Function
################


get("/clear") do
  Dictionary.clear()
  @dictionaries = Dictionary.all()
  erb(:index)
end

################
#Delete Function
################

get("/dictionaries/:id/delete") do
  dictionary=Dictionary.find(params.fetch("id").to_i())
  dictionary.delete()
  @dictionaries = Dictionary.all()
  erb(:index)
end
