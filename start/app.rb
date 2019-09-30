  require( 'sinatra' )
  require( 'sinatra/reloader' )
  # require_relative('controllers/')
  require_relative('./controllers/sights_controller')

  get '/' do
    erb( :home )
  end
