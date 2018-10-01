class ArtController <Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }

  # Index
  get '/art' do
    @title = "PRETENTIOUS ART LIST"
    @art = Art.all_and_artists

    erb :'art/index'
  end

  # Nieuw
  get '/art/new' do
    erb :'art/new'
  end

  # Show
  get '/art/:id' do
    id = params[:id].to_i
    @art = Art.find_the_artist id

    erb :'art/show'
  end

  # Create
  post '/art' do

    art = Art.new

    art.img = params[:img]
    art.title = params[:title]
    art.year = params[:year]
    art.description = params[:description]
    art.displayed = params[:displayed]

    art.save

    redirect '/art'

  end

  # Update

  put '/art/:id' do
    id = params[:id].to_i

    art = Art.find id

    art.img = params[:img]
    art.title = params[:title]
    art.year = params[:year]
    art.description = params[:description]
    art.displayed = params[:displayed]

    art.save

    redirect '/art'

  end

  # Delete
  delete '/art/:id' do
    id = params[:id].to_i
    Art.destroy id

    redirect '/art'
  end

  # Edit

  get '/art/:id/edit' do
    id = params[:id].to_i
    @art = Art.find id

    erb :'art/edit'
  end

end
