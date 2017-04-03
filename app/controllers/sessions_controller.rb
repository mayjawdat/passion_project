# get login form
get '/sessions/new' do
  erb :'/sessions/new'
end

# create new login
post '/sessions/' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:hashed_password])
    session[:user_id] = @user.id
    redirect '/users/#{@user.id}'
  else
    redirect '/sessions/new'
  end
end

# end session
delete '/sessions/' do
  session[:user_id] = nil
  redirect '/'
end