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

   if @user.save
     login
     redirect "/users/#{@user.id}"
   else
     erb :'/users/new'
   end
end

# display user profile
get '/users/:id' do
  @user_orders = current_user.orders
  
  erb :'/users/show'
end