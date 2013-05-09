get '/' do
  
  erb :index
end

get '/login' do
  
  erb :login
end


get '/create' do
  
  erb :create
end

post '/profile' do 
  p "YEH!!!"
  p params
  @user = User.find_by_email(params[:email])

  # @user = User.new(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], birthdate: params[:birthdate], password_digest: params[:password_digest])
  # # @user.encrypt_password
  # if @user.valid?
  #   @user.save
  #   session[:user_id] = @user.id
    erb :profile
  # else
  #   @error = "Invalid Username/Email/Password"
  #   redirect '/'
  # end
end

post '/profile/:id' do
  @user = User.find_by_id(params[:id])
  erb :profile
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/events/:id' do
  @user = User.find_by_id(params[:id])
  erb :events
end

get '/event/create' do
  erb :create_event
end

post '/:id/event/create' do
  @event = Event.create(name: params[:event_name], location: params[:event_location], starts_at: params[:start], ends_at: params[:end], user_id: params[:id], created_at: DateTime.now, updated_at: DateTime.now)
  
  @user = User.find_by_id(params[:id])

  @user.created_events << @event

  erb :events
end

get '/:id/event/create' do
  @user = User.find(params[:id])
  erb :create_event
end
