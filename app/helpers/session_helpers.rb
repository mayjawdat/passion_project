helpers do

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def login
    session[:id] = @user.id
  end

  def logout
    session[:id] = nil
  end

  def logged_in?
    !!current_user
  end
  
end