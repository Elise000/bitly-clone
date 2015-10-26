require 'byebug'

post '/urls' do #create a new URL
# byebug
 # Url.create(long_url: params[:url][:long])
 @url = Url.new(long_url: params[:long_url])
# byebug
  if @url.save

    # redirect '/'

    # return @url.shorten_url.to_json
    return @url.to_json
  else
    @urls = Url.all
    @failed = true

    erb :'static/index'
    # redirect "", url.errors: "INVALID"
  end

# byebug
end

get '/urls' do
  redirect '/'
end

get '/all-links' do
  @links = Url.pluck(:id, :shorten_url, :long_url)

  @links.to_json
end

get '/:short_url' do #redirect to appropriate "long" URL
  # puts "[LOG] Getting /:short_url"
  # puts "[LOG] Params: #{params.inspect}"
  url = Url.find_by(shorten_url: params[:short_url])
  url.count
# byebug
  # url.click_count += 1
  # url.save
  redirect "#{url.long_url}"

end

#git testing...hahaha


#display all links in ajax
#1) click on a button
#2) load all links
#3) display all links without reloading whole page


