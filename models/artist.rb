require('pg')
# require_relative('../db/sql_runner.rb')
require_relative('./album.rb')
class Artist
  attr_reader :name, :id


  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    db = PG.connect({dbname: 'music_collection', host: 'localhost'})
    sql = "INSERT INTO artist(name)
    VALUES($1) RETURNING id"
    values = [@name]
    db.prepare("save", sql)
    result = db.exec_prepared("save", values)
    db.close()
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    db = PG.connect({dbname: 'music_collection', host: 'localhost'})
    sql = "DELETE FROM artist"
    db.prepare("delete_all", sql)
    result = db.exec_prepared("delete_all")
    db.close()
  end

end
