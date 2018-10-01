class AuthorController <Sinatra::Base

  configure :development do
    register Sinatra::Reloader
  end

  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }

  # Index
  get '/author' do
    @title = "PRETENTIOUS ARTISTS LIST"
    @author = Author.all

    erb :'author/index'
  end

  # Nieuw
  get '/author/new' do
    erb :'author/new'
  end

  # Show
  get '/author/:id' do
    id = params[:id].to_i
    @author = Author.find id

    erb :'author/show'
  end

  # Create
  post '/author' do

    author = Author.new

    author.first_name = params[:first_name]
    author.last_name = params[:last_name]
    author.dob = params[:dob]
    author.nationality = params[:nationality]
    author.periods = params[:periods]

    author.save

    redirect '/author'

  end

  # Update

  put '/author/:id' do
    id = params[:id].to_i

    author = Author.find id

    author.first_name = params[:first_name]
    author.last_name = params[:last_name]
    author.dob = params[:dob]
    author.nationality = params[:nationality]
    author.periods = params[:periods]

    author.save

    redirect '/author'

  end

  # Delete
  delete '/author/:id' do
    id = params[:id].to_i
    Author.destroy id

    redirect '/author'
  end

  # Edit

  get '/author/:id/edit' do
    id = params[:id].to_i
    @author = Author.find id

    erb :'author/edit'
  end

end
