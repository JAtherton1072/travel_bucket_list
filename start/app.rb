  require( 'sinatra' )
  require( 'sinatra/reloader' )
  # require_relative('controllers/')
  require_relative('./controllers/sights_controller')
  require_relative('./controllers/countries_controller')
  require_relative('./controllers/cities_controller')
  require_relative('./controllers/bucketlist_controller')

  get '/' do
    erb( :index )
  end
