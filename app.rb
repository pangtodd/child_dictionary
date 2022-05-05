require('sinatra')
require('sinatra/reloader')
require('./lib/word')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @words = Word.all
  erb(:words)
end

get('/words') do
  @words = Word.all
  erb(:words)
end

get('/words/new') do
  erb(:new_word)
end

get('/words/:id') do
  @word = Word.find(params[:id].to_i())
  erb(:album)
  "This route will show a specific album based on its ID. The value of ID here is #{params[:id]}."
end

post('/words') do
  name = params[:word_name]
  word = Word.new(name, nil)
  word.save()
  @words = Word.all()
  erb(:words)
end

get('/words/:id/edit') do
  "This will take us to a page with a form for updating an album with an ID of #{params[:id]}."
end

patch('/words/:id') do
  "This route will update an album. We can't reach it with a URL. In a future lesson, we will use a form that specifies a PATCH action to reach this route."
end

delete('/words/:id') do
  "This route will delete an album. We can't reach it with a URL. In a future lesson, we will use a delete button that specifies a DELETE action to reach this route."
end

get('/custom_route') do
  "We can even create custom routes, but we should only do this when needed."
end