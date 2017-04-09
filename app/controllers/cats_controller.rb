# display list of cats
get '/cats' do
  @cats = Cat.all
  erb :'/cats/index'
end

# display specific cat
get '/cats/:id' do
  @cat = Cat.find(params[:id])
  @order = Order.find_by(cat_id: params[:id], user_id: current_user.id)
  erb :'/cats/show'
end