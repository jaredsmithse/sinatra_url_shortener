require 'debugger' 
post '/urls' do
  args = generate_short_url(params)
  args[:user_id] = current_user.id rescue nil
  Url.create(args)
  redirect '/'
end

get '/url/:short_url' do
  Url.find_by_short_url(params[:short_url]).clicked!
  redirect Url.find_by_short_url(params[:short_url]).full_url
end
