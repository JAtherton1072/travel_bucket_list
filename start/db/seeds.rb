  require( 'pry' )
  require_relative( '../models/bucket_list' )
  require_relative( '../models/sight' )
  require_relative( '../models/city' )
  require_relative( '../models/country' )
  require_relative( '../models/continent' )


  BucketList.delete_all
  Sight.delete_all()
  City.delete_all()
  Country.delete_all()
  Continent.delete_all()


  continent1 = Continent.new({'name' => 'Oceania'})
  continent1.save()
  continent2 = Continent.new({'name' => 'Asia'})
  continent2.save()
  continent3 = Continent.new({'name' => 'Africa'})
  continent3.save()
  continent4 = Continent.new({'name' => 'Europe'})
  continent4.save()
  continent5 = Continent.new({'name' => 'South America'})
  continent5.save()
  continent6 = Continent.new({'name' => 'North America'})
  continent6.save()




  country1 = Country.new({'name' => 'Australia', 'continent_id' => continent1.id})
  country1.save()
  country2 = Country.new({'name' => 'Italy', 'continent_id' => continent4.id})
  country2.save()
  country3 = Country.new({'name' => 'England', 'continent_id' => continent4.id})
  country3.save()
  country4 = Country.new({'name' => 'Scotland', 'continent_id' => continent4.id})
  country4.save()
  country5 = Country.new({'name' => 'France', 'continent_id' => continent4.id})
  country5.save()
  country6 = Country.new({'name' => 'India', 'continent_id' => continent2.id})
  country6.save()
  country7 = Country.new({'name' => 'United States', 'continent_id' => continent6.id})
  country7.save()
  country8 = Country.new({'name' => 'South Africa', 'continent_id' => continent3.id})
  country8.save()
  country9 = Country.new({'name' => 'New Zealand', 'continent_id' => continent1.id})
  country9.save()
  country10 = Country.new({'name' => 'Germany', 'continent_id' => continent4.id})
  country10.save()




  city1 = City.new({'name' => 'Sydney', 'country_id' => country1.id})
  city1.save()
  city2 = City.new({'name' => 'Auckland', 'country_id' => country9.id})
  city2.save()
  city3 = City.new({'name' => 'Agra', 'country_id' => country6.id})
  city3.save()
  city4 = City.new({'name' => 'Rome', 'country_id' => country2.id})
  city4.save()
  city5 = City.new({'name' => 'Paris', 'country_id' => country5.id})
  city5.save()
  city6 = City.new({'name' => 'London', 'country_id' => country3.id})
  city6.save()
  city7 = City.new({'name' => 'Edinburgh', 'country_id' => country4.id})
  city7.save()
  city8 = City.new({'name' => 'Capetown', 'country_id' => country8.id})
  city8.save()
  city9 = City.new({'name' => 'Berlin', 'country_id' => country10.id})
  city9.save()
  city10 = City.new({'name' => 'New York', 'country_id' => country7.id})
  city10.save()




  sight1 = Sight.new({'name' => 'Opera House', 'city_id' => city1.id})
  sight1.save()
  sight2 = Sight.new({'name' => 'Sky Tower', 'city_id' => city2.id})
  sight2.save()
  sight3 = Sight.new({'name' => 'Berlin Wall', 'city_id' => city9.id})
  sight3.save()
  sight4 = Sight.new({'name' => 'Taj Mahal', 'city_id' => city3.id})
  sight4.save()
  sight5 = Sight.new({'name' => 'Statue of Liberty', 'city_id' => city10.id})
  sight5.save()
  sight6 = Sight.new({'name' => 'Eiffel Tower', 'city_id' => city5.id})
  sight6.save()
  sight7 = Sight.new({'name' => 'Colosseum', 'city_id' => city4.id})
  sight7.save()
  sight8 = Sight.new({'name' => 'Lego Land', 'city_id' => city6.id})
  sight8.save()
  sight9 = Sight.new({'name' => 'Edinburgh Castle', 'city_id' => city7.id})
  sight9.save()
  sight10 = Sight.new({'name' => 'Table Mountain', 'city_id' => city8.id})
  sight10.save()




  bucket_list1 = BucketList.new({'sight_id' => sight1.id, 'visited' => 1})
  bucket_list1.save()
  bucket_list2 = BucketList.new({'sight_id' => sight2.id, 'visited' => 1})
  bucket_list2.save()
  bucket_list3 = BucketList.new({'sight_id' => sight3.id, 'visited' => 0})
  bucket_list3.save()
  bucket_list4 = BucketList.new({'sight_id' => sight4.id, 'visited' => 0})
  bucket_list4.save()
  bucket_list5 = BucketList.new({'sight_id' => sight5.id, 'visited' => 0})
  bucket_list5.save()
  bucket_list6 = BucketList.new({'sight_id' => sight6.id, 'visited' => 1})
  bucket_list6.save()
  bucket_list7 = BucketList.new({'sight_id' => sight7.id, 'visited' => 0})
  bucket_list7.save()
  bucket_list8 = BucketList.new({'sight_id' => sight8.id, 'visited' => 0})
  bucket_list8.save()
  bucket_list9 = BucketList.new({'sight_id' => sight9.id, 'visited' => 0})
  bucket_list9.save()
  bucket_list10 = BucketList.new({'sight_id' => sight10.id, 'visited' => 1})
  bucket_list10.save()




# city1.name = "Sydney NSW"
# city1.update



# all_sights = Sight.all

# all_sights.each do |sight|
# p sight.city
# p sight.country
# p sight.continent


# end
# binding.pry







# nil
