# get form to create new order
get '/users/:user_id/orders/new' do
  @user = current_user
  erb :'/orders/new'
end

# create new 
post '/orders' do
  @order = Order.new(params[:order])
  @cat = Cat.find(params[:order][:cat_id])

  if @order.save
    @cat.available = false
    redirect "/users/#{current_user.id}"
  else
    @errors = @order.errors.full_messages
    erb :'/orders/new'
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
  @cat = Cat.find(params[:cat_id])
  @cat.available = true

  if request.xhr?
    @order.destroy
  else
    redirect "/users/#{current_user.id}"
  end
end