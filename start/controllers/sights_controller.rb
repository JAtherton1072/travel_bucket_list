 require('sinatra')
 require('sinatra/reloader')
 require_relative('../models/sight')
 require_relative('../models/city')

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



 # EDIT

 get '/sights/:id/edit' do
   @cities = City.all
   @sights = Sight.find(params['id'])
   erb( :"sights/edit" )

   end


   # UPDATE

   put '/sights/:id' do
     Sight.new(params).update
     redirect '/sights'
   end



   # DELETE

   post '/sights/:id/delete' do
     Sight.find(params['id']).delete
     redirect '/sights'
   end
