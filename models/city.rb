  require_relative('../db/sql_runner')

  class City

    attr_reader :id
    attr_accessor :name, :country_id

    def initialize(options)
      @id = options['id'].to_i
      @name = options['name']
      @country_id = options['country_id'].to_i
    end


    def save()
      sql = "INSERT INTO cities
      (
        name, country_id
      )
      VALUES
      (
      $1, $2
      )
      RETURNING *"
      values = [@name, @country_id]
      city = SqlRunner.run(sql, values).first
      @id = city['id'].to_i
    end


    def self.delete_all()
      sql = "DELETE FROM cities"
      SqlRunner.run(sql)
    end


    def self.map_items(data)
      result = data.map{|city| City.new(city)}
      return result
    end


    def update()
      sql = "UPDATE cities SET (name, country_id) = ($1, $2) WHERE id = $3"
      values = [@name, @country_id, @id]
      SqlRunner.run(sql, values)
    end


    def delete()
      sql = "DELETE FROM cities where id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end


    def self.all()
      sql = "SELECT * FROM cities"
      city_data = SqlRunner.run(sql)
      return City.map_items(city_data)
    end




  end
