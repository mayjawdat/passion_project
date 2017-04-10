# get form to create new order
get '/users/:user_id/orders/new' do
  @user = current_user  
end

# create new 
post '/orders' do
  @user = User.find_by(id: session[:id])
  @order = Order.new(params[:order])
  @cat = Cat.find(params[:order][:cat_id])

  if @order.save
    redirect "/users/#{@user.id}"
  else
    @errors = @order.errors.full_messages
    redirect "/cats/#{@order.cat_id}"
  end
end

# display order details
get '/orders/:id' do
  @order = Order.find(params[:id])
  erb :'/order/show'
  end

# end order
delete '/orders/:id' do
  @order = Order.find(params[:id])
  if request.xhr?
    @order.destroy
  else
    redirect "/users/#{current_user.id}"
  end
end