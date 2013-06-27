
get '/' do
  @urls = Url.all
  if logged_in?
    redirect '/user_home'
  else
    erb :index
  end
end
