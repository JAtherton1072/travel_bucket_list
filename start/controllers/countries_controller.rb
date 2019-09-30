  require('sinatra')
  require('sinatra/reloader')
  require_relative('../models/country')

  also_reload('../models/*')

  # index
  get '/countries' do
    @countries = Country.all
    erb( :index )
  end
