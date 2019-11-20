
require_relative('./artist.rb')
# require_relative('../db/sql_runner.rb')
class Album
    attr_accessor :title, :genre, :artist_id
    attr_reader :id
    def initialize( options )
      @id = options['id'].to_i if options['id']
      @title = options['title']
      @genre = options['genre']
      @artist_id = options['artist_id'].to_i

    end

    def save()
      db = PG.connect({dbname: 'music_collection', host: 'localhost'})
      sql = "INSERT INTO album
      (title,genre,artist_id)
      VALUES($1,$2,$3) RETURNING id"
      values = [@title, @genre, @artist_id]
      db.prepare("save", sql)
      result = db.exec_prepared("save", values)
      db.close()
      @id = result[0]['id'].to_i
    end

    def self.delete_all()
      db = PG.connect({dbname: 'music_collection', host: 'localhost'})
      sql = "DELETE FROM album"
      db.prepare("delete_all", sql)
      result = db.exec_prepared("delete_all")
      db.close()
    end


end
