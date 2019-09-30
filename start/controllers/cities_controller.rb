  require('sinatra')
  require('sinatra/reloader')
  require_relative('../models/city')

  also_reload('../models/*')

  # index
  get '/cities' do
    @cities = City.all
    erb( :"cities/index" )
  end




  # NEW


  get '/cities/new' do
    @countries = Country.all
    erb( :"cities/new" )
  end


  # CREATE

  post '/cities' do
    City.new(params).save
    redirect '/cities'


  end
