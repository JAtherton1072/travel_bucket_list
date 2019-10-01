  require_relative('../db/sql_runner')

  class Country

    attr_reader :id
    attr_accessor :name, :continent_id

    def initialize(options)
      @id = options['id'].to_i
      @name = options['name']
      @continent_id = options['continent_id'].to_i
    end


    def save()
      sql = "INSERT INTO countries
      (
        name, continent_id
      )
      VALUES
      (
        $1, $2
      )
      RETURNING *"
      values = [@name, @continent_id]
      country = SqlRunner.run(sql, values).first
      @id = country['id'].to_i
    end


    def self.delete_all()
      sql = "DELETE FROM countries"
      SqlRunner.run(sql)
    end




  # crud copied from city



    def self.map_items(data)
      result = data.map{|country| Country.new(country)}
      return result
    end


    def update()
      sql = "UPDATE countries SET (name, continent_id) = ($1, $2) WHERE id = $3"
      values = [@name, @continent_id, @id]
      SqlRunner.run(sql, values)
    end


    def delete()
      sql = "DELETE FROM countries where id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end


    def self.all()
      sql = "SELECT * FROM countries"
      country_data = SqlRunner.run(sql)
      return Country.map_items(country_data)
    end


    def self.find( id )
      sql = "SELECT * FROM countries WHERE id = $1"
      values = [id]
      country = SqlRunner.run( sql, values )
      result = Country.new( country.first )
      return result
    end







  end
