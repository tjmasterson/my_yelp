get "/:restaurants_id/reviews/new" do
  @restaurant = Restaurant.where(id: params[:restaurants_id]).first
  puts @restaurant
  erb :"reviews/new"
end

post "/:restaurants_id/reviews/new" do
  @review = Review.create(params[:review])
  @restaurant = Restaurant.where(id: params[:restaurants_id]).first

  erb :"restaurants/show"
end
