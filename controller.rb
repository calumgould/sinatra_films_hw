require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")

require_relative("./models/customer")
require_relative("./models/film")
require_relative("./models/screening")
require_relative("./models/ticket")
also_reload("./models/*")

get "/" do
  erb(:home)
end

get "/films" do
  @films = Film.all()
  erb(:films)
end

get "/films/:id" do
  @film = Film.film_by_id(params[:id])
  erb(:film_details)
end
