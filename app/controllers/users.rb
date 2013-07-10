post '/signin' do
  user = User.find_by_email(params[:sign_in][:email])
  stored_password = user.password_hash
  given_password = Digest::MD5.hexdigest(params[:sign_in][:password_hash] + user.salt)
  if stored_password == given_password
    session[:user_id] = set_current_user(user.email)
    redirect '/user_home'
  else
    redirect '/'
  end
end

post '/signup' do
  User.create(create_user(params[:sign_up]))
  session[:user_id] = set_current_user(params[:sign_up][:email])
  redirect '/user_home'
end



get '/signup' do 
  haml :signup
end

get '/signin' do
  haml :signin
end



get '/user_home' do
  if logged_in?
    @urls = Url.all 
    current_user
    haml :user_home
  else
    redirect '/'
  end
end