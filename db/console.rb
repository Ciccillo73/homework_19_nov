require('pry-byebug')
require_relative('../models/artist')
require_relative('../models/album')
Album.delete_all()
Artist.delete_all()
artist1 = Artist.new({'name' => 'QUEEN'})
artist1.save()

album1 = Album.new({
  'title' => 'Innuendo',
  'genre' => 'Rock',
  'artist_id' => artist1.id
    })
album1.save()

binding.pry
nil
