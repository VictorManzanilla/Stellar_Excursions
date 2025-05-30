require "sinatra"
require "sinatra/reloader"
require "dotenv/load"
require "http"
require "json"

get("/") do
# pp ENV.fetch("NASA_API_KEY")
  # https://images-api.nasa.gov
  
  api_key = ENV['NASAAPIKEY']
  puts api_key
  url = "https://api.nasa.gov/planetary/apod?api_key=#{api_key}" 
  
  response = HTTP.get(url)  
  @data = JSON.parse(response)
  @info_image = @data.fetch("explanation")
  @get_image = @data.fetch("hdurl")

  erb(:home)
end
#######################################################################
get("/mars") do
  api_key = ENV['NASAAPIKEY']

  pp api_key
  url = "https://api.nasa.gov/insight_weather/?api_key=#{api_key}&feedtype=json&ver=1.0" 
  
  response = HTTP.get(url)  
  @mars_data = JSON.parse(response)
  @sol675 = @mars_data.fetch("675", {})
  @at = @sol675.fetch("AT", {})
  @temperature = @at.fetch("av")
  @season = @sol675.fetch("Season")

  # @season = @mars_data.fetch("Season")
  

  erb(:mars)
end
#####################################################################
get("/jupiter") do

  erb(:jupiter)
end
########################################################################
get("/saturn") do

  erb(:saturn)
end
