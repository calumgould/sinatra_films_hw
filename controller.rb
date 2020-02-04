require("sinatra")
require("sinatra/contrib/all")
require("pry-byebug")

require_relative("./models/customer")
require_relative("./models/film")
require_relative("./models/screening")
require_relative("./models/ticket")
also_reload("./models/*")
