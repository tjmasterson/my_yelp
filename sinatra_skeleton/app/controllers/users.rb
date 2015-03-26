require 'bcrypt'
get "/login" do
  @user = User.new

  erb :"index"
end

post "/login" do
  if user = User.authenticate(params[:user])
    session[:user_id] = user.id
    redirect "/restaurants"
  else
    @errors = user.errors.messagesra
    erb :"index"
  end
end

get "/users/new" do
  @user = User.new

  erb :"users/new"
end

post "/users/new" do
  @user = User.create(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect "/restaurants"
  else
    @errors = @user.errors.messages
    puts @errors
    erb :"index"
  end

end
get '/logout' do
  session[:user_id] = nil
  redirect '/login'
end
