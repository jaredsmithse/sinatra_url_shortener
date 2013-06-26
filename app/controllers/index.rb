get '/' do
  @urls = Url.all
  erb :index
end

post '/urls' do
  Url.create(generate_short_url(params))
  redirect '/'
end

get '/:short_url' do
  Url.find_by_short_url(params[:short_url]).clicked!
  redirect Url.find_by_short_url(params[:short_url]).full_url
end
