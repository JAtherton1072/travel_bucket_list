 require('sinatra')
 require('sinatra/reloader')
 require_relative('../models/sight')

 also_reload('../models/*')

 # index
 get '/sights' do
   @sights = Sight.all
   erb( :"sights/index" )
 end




 # NEW


 get '/sights/new' do
   @cities = City.all
   erb( :"sights/new" )
 end


 # CREATE

 post '/sights' do
   Sight.new(params).save
   redirect '/sights'


 end
