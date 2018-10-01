class Art

  attr_accessor :id, :img, :title, :year, :period, :description, :displayed, :artist_id, :artist

  def self.open_conection
    conn = PG.connect( dbname: 'artwork' )
  end

  def save
    conn = Art.open_conection

    if !self.id
      sql = "INSERT INTO artworks (img, title, year, period, description, displayed) VALUES ('#{self.img}', '#{self.title}', '#{self.year}', '#{self.period}', '#{self.description}','#{self.displayed}')"

    else
      sql = "UPDATE artworks SET img='#{self.img}', title='#{self.title}', year='#{self.year}', period='#{self.period}', description='#{self.description}',displayed='#{self.displayed}' WHERE id='#{self.id}'"
    end

    conn.exec(sql)

  end

  def self.all

    conn = self.open_conection

    sql = "SELECT * FROM artworks ORDER BY id"
    results = conn.exec(sql)

    art = results.map do |art|
      self.hydrate art
    end

    art

  end

  def self.all_and_artists
    conn = self.open_conection

    sql = "SELECT artworks.id, artworks.img, artworks.title, artworks.year, artworks.period, artworks.description, artworks.displayed, artworks.artist_id, artists.id, artists.first_name, artists.last_name FROM artworks JOIN artists ON artworks.artist_id = artists.id"

    results = conn.exec(sql)

    art = results.map do |art|
      self.hydrate art
    end

    art

  end

  def self.find id
    conn = self.open_conection

    sql = "SELECT * FROM artworks WHERE id=#{id}"

    results = conn.exec(sql)

    art = self.hydrate results[0]

    art

  end

  def self.find_the_artist id

    conn = self.open_conection

    sql = "SELECT artworks.id, artworks.img, artworks.title, artworks.year, artworks.period, artworks.description, artworks.displayed, artworks.artist_id, artists.id, artists.first_name, artists.last_name FROM artworks JOIN artists ON artworks.artist_id = artists.id WHERE artists.id=#{id}"

    results = conn.exec(sql)

    art = self.hydrate results[0]

    art

  end

  def self.destroy id
    conn = self.open_conection
    sql = "DELETE FROM artworks WHERE id=#{id}"
    conn.exec(sql)
  end

  def self.hydrate artworks_data

    art = Art.new

    art.id = artworks_data['id']
    art.img = artworks_data['img']
    art.title = artworks_data['title']
    art.year = artworks_data['year']
    art.period = artworks_data['period']
    art.description = artworks_data['description']
    art.displayed = artworks_data['displayed']
    art.artist_id = artworks_data['artist_id']
    art.artist = "#{artworks_data['first_name']} #{artworks_data['last_name']}"


    art


  end

end
