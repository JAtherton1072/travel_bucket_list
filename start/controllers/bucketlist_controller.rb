require('sinatra')
require('sinatra/reloader')
require_relative('../models/bucket_list')
require_relative('../models/sight')

also_reload('../models/*')

# index
get '/bucketlists' do
  @sights = Sight.all
  erb( :"bucketlists/index" )
end

get '/toggle-visited' do
  BucketList.toggle_visted(params['visited'], params['sight_id'])
  redirect to '/bucketlists'
end
