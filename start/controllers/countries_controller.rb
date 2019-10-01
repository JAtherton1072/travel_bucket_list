  require('sinatra')
  require('sinatra/reloader')
  require_relative('../models/country')
  require_relative('../models/continent')

  also_reload('../models/*')

  # index
  get '/countries' do
    @countries = Country.all
    erb( :"countries/index" )
  end



  # NEW


  get '/countries/new' do
    @continents = Continent.all
    erb( :"countries/new" )
  end


  # CREATE

  post '/countries' do
    Country.new(params).save
    redirect '/countries'


  end



  # EDIT

  get '/countries/:id/edit' do
    @continents = Continent.all
    @countries = Country.find(params['id'])
    erb( :"countries/edit" )

    end


    # UPDATE

    put '/countries/:id' do
      Country.new(params).update
      redirect '/countries'
    end



    # DELETE

    post '/countries/:id/delete' do
      Country.find(params['id']).delete
      redirect '/countries'
    end
