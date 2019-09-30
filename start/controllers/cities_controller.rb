  require('sinatra')
  require('sinatra/reloader')
  require_relative('../models/city')

  also_reload('../models/*')

  # index
  get '/cities' do
    @cities = City.all
    erb( :"cities/index" )
  end
