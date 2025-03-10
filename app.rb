require "sinatra"
require "sinatra/reloader"
require "dotenv/load"
require "http"
require "json"

get("/") do
# pp ENV.fetch("NASA_API_KEY")
  # https://images-api.nasa.gov
  
  api_key = ENV.fetch("NASA_API_KEY")  
  url = "https://api.nasa.gov/planetary/apod?api_key=#{api_key}" 
  
  response = HTTP.get(url)  
  @data = JSON.parse(response)
  @info_image = @data.fetch("explanation")
  @get_image = @data.fetch("hdurl")

  erb(:home)
end
#######################################################################
get("/mars") do

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
###################################################################
get("/random") do

  erb(:random)
end
