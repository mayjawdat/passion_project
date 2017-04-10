# display list of cats
get '/cats' do
  @cats = Cat.all
  erb :'/cats/index'
end

# get form to add new cat
get '/cats/new' do
  erb :'/cats/new'
end

# display specific cat
get '/cats/:id' do
  @cat = Cat.find(params[:id])
  erb :'/cats/show'
end

# add new cat
post '/cats' do
  @cat = Cat.new(params[:cat])

  if @cat.save
    redirect "/cats"
  else
    @errors = @user.errors.full_messages
    erb :'/cats/new'
  end
end