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





  # EDIT

  get '/cities/:id/edit' do
    @countries = Country.all
    @cities = City.find(params['id'])
    erb( :"cities/edit" )

    end


    # UPDATE

    put '/cities/:id' do
      City.new(params).update
      redirect '/cities'
    end



    # DELETE

    post '/cities/:id/delete' do
      City.delete(params[:id])
      redirect '/cities'
    end
