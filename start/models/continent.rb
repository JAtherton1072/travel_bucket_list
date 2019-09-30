  require_relative('../db/sql_runner')

  class Continent

    attr_reader :id
    attr_accessor :name

    def initialize(options)
      @id = options['id'].to_i
      @name = options['name']
    end

    def save()
      sql = "INSERT INTO continents
      (
      name
      )
      VALUES
      (
        $1
      )
      RETURNING *"
      values = [@name]
      continent = SqlRunner.run(sql, values).first
      @id = continent['id'].to_i
    end


    def self.delete_all()
      sql = "DELETE FROM continents"
      SqlRunner.run(sql)
    end



    def self.all()
      sql = "SELECT * FROM continents"
      continent_data = SqlRunner.run(sql)
      return Continent.map_items(continent_data)
    end


    def self.map_items(data)
      result = data.map{|continent| Continent.new(continent)}
      return result
    end





  end
