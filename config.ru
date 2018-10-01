require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?
require 'pg'
require_relative './models/Art.rb'
require_relative './models/Author.rb'
require_relative './controllers/static_controller.rb'
require_relative './controllers/art_controller.rb'
require_relative './controllers/author_controller.rb'

use Rack::Reloader
use Rack::MethodOverride

run Rack::Cascade.new([
  StaticController,
  ArtController,
  AuthorController
])
