class Pokemon

    
    attr_accessor :name, :type, :db, :id

    def initialize (id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?);"
        db.execute(sql, name, type)
    end

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?;"
        captured = db.execute(sql, id).flatten
        new_pokemon = self.new(id: captured[0], name: captured[1], type: captured[2], db: db)
    end
end
