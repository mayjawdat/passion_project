# get login form
get '/sessions/new' do
  erb :'/sessions/new'
end

# create new login
post '/sessions/' do
  @user = User.find_by(email: params[:user][:email])

  if @user && @user.authenticate(params[:user][:password])
    login
    redirect "/users/#{@user.id}"
  else
    @errors = @user.errors.full_messages
    redirect '/sessions/new'
  end
end

# end session
delete '/sessions/:id' do
  logout
  redirect '/'
end