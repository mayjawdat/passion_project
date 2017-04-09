get '/users/' do
  erb :'/users/index'
end

# get form to create new user
get '/users/new' do
  erb :'/users/new'
end

# create new user
post '/users' do
  @user = User.new(params[:user])
  @user.password = params[:user][:password]

  if @user.save
    redirect "/users/#{@user.id}"
    erb :'/users/show'
  else
    redirect '/users/new'
    erb :'/users/new'
  end
end

# display user profile
get '/users/:id' do
  @user = current_user
  @user_orders = @user.orders
  erb :'/users/show'
end