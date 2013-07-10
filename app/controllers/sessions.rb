
get '/' do
  @urls = Url.all
  if logged_in?
    redirect '/user_home'
  else
    haml :index
  end
end
