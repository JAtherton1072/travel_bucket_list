  require_relative('../db/sql_runner')

  class Sight

    attr_reader :id
    attr_accessor :name, :city_id

    def initialize(options)
      @id = options['id'].to_i
      @name = options['name']
      @city_id = options['city_id'].to_i
    end

    def save()
      sql = "INSERT INTO sights
      (
        name, city_id
      )
      VALUES
      (
        $1, $2
      )
      RETURNING *"
      values = [@name, @city_id]
      sight = SqlRunner.run(sql, values).first
      @id = sight['id'].to_i
    end




    def self.delete_all()
      sql = "DELETE FROM sights"
      SqlRunner.run(sql)
    end


    def city

      sql = "SELECT cities.* FROM cities INNER JOIN sights ON cities.id = sights.city_id
      WHERE sights.city_id = $1"
      values = [@city_id]
      return SqlRunner.run(sql, values)[0]

    end

    def country
      city = self.city

      sql = "SELECT countries.* FROM countries INNER JOIN cities ON countries.id = cities.country_id WHERE cities.country_id = $1"
      values = [city["country_id"]]
      return SqlRunner.run(sql, values)[0]

    end




    def continent
      country = self.country

      sql = "SELECT continents.* FROM continents INNER JOIN countries ON continents.id = countries.continent_id WHERE countries.continent_id = $1"
      values = [country["continent_id"]]
      return SqlRunner.run(sql, values)[0]




    end



    def self.all()
    sql = "SELECT * FROM sights"
    sight_data = SqlRunner.run(sql)
    return Sight.map_items(sight_data)
    end



    #Helper methods for mapping
    def self.map_items(sight_data)
    result = sight_data.map { |sight| Sight.new( sight ) }
    return result
    end




  end
