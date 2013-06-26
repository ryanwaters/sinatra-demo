require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'open-uri'

get '/' do 
  @name = "Ryan Waters"
  erb :home
end

get '/search' do
	@query = params[:q] 
	url = "http://www.omdbapi.com/?s=#{URI.escape(@query)}"
	@results = JSON.load(open(url).read)
	@movies = @results["Search"]
	erb :result

end

get '/movie' do
	@imdbid = params[:id]
	url = "http://www.omdbapi.com/?i=#{URI.escape(@imdbid)}"
	@movie = JSON.load(open(url).read)
	erb :movies
end




