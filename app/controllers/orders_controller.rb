# get form to create new order
get '/users/:user_id/orders/new' do
  @user = current_user
  erb :'/orders/new'
end

# create new 
post '/orders' do
  @order = Order.new(params[:order])

  if @order.save
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
  @cat = @order.cat
  @order.destroy
  @cat.update(order_id: nil)

  if request.xhr?
    status 200
  else
    redirect "/users/#{current_user.id}"
  end
end