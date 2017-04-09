# get login form
get '/sessions/new' do
  erb :'/sessions/new'
end

# create new login
post '/sessions/' do
  @user = User.find_by(email: params[:user][:email])
  p "*" * 50
  p params
  p @user
  p "*" * 50

  if @user && @user.authenticate(params[:user][:password])
    session[:id] = @user.id
    redirect "/users/#{@user.id}"
  else
    redirect '/sessions/new'
  end
end

# end session
delete '/sessions/' do
  session[:id] = nil
  redirect '/'
end