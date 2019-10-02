  require_relative('../db/sql_runner')

  class BucketList

    attr_reader :id
    attr_accessor :sight_id, :visited

    def initialize(options)
      @id = options['id'].to_i
      @sight_id = options['sight_id'].to_i
      @visited = options['visited'].to_i
    end

    def save()
      sql = "INSERT INTO bucket_lists
      (
        sight_id, visited
      )
      VALUES
      (
        $1, $2
      )
      RETURNING *"
      values = [@sight_id, @visited]
      bucket_list = SqlRunner.run(sql, values).first
      @id = bucket_list['id'].to_i
    end




    def self.delete_all()
      sql = "DELETE FROM bucket_lists"
      SqlRunner.run(sql)
    end



    def self.all()
      sql = "SELECT * FROM bucket_lists"
      bucket_data = SqlRunner.run(sql)
      return BucketList.map_items(bucket_data)
    end


    def self.map_items(data)
      result = data.map{|bucket| BucketList.new(bucket)}
      return result
    end

    def self.toggle_visted(visited, sight_id)
      sql = "UPDATE bucket_lists SET visited = $1 WHERE sight_id = $2"
      values = [visited, sight_id]
      SqlRunner.run(sql, values)
    end

    def self.delete(sight_id)
      sql = "DELETE FROM bucket_lists WHERE sight_id = $1"
      values = [sight_id]
      SqlRunner.run(sql, values)

    end

    def self.toggle_on_bucket_list(sight_id, add_to_list)
      if add_to_list == "true"
        BucketList.new({"sight_id" => sight_id, "visited" => 0}).save
      elsif add_to_list == "false"
        BucketList.delete(sight_id)
      end
    end

  end
