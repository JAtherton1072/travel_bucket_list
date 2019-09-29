 require('sinatra')
 require('sinatra/reloader')
 require_relative('../models/sight')

 also_reload('../models/*')

 # index
 get '/sights' do
   @sights = Sight.all
   erb( :index )
 end
