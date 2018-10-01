class Author

  attr_accessor :id, :first_name, :last_name, :dob, :nationality, :periods

  def self.open_conection
    conn = PG.connect( dbname: 'artwork' )
  end

  def save
    conn = Author.open_conection

    if !self.id
      sql = "INSERT INTO artists (first_name, last_name, dob, nationality, periods) VALUES ('#{self.first_name}', '#{self.last_name}', '#{self.dob}', '#{self.nationality}', '#{self.periods}')"

    else
      sql = "UPDATE artists SET first_name='#{self.first_name}', last_name='#{self.last_name}', dob='#{self.dob}', nationality='#{self.nationality}', periods='#{self.periods}' WHERE id='#{self.id}'"
    end

    conn.exec(sql)

  end

  def self.all

    conn = self.open_conection

    sql = "SELECT * FROM artists ORDER BY id"
    results = conn.exec(sql)

    author = results.map do |author|
      self.hydrate author
    end

    author

  end

  def self.find id
    conn = self.open_conection

    sql = "SELECT * FROM artists WHERE id=#{id}"

    results = conn.exec(sql)

    author = self.hydrate results[0]

    author

  end

  def self.destroy id
    conn = self.open_conection
    sql = "DELETE FROM artists WHERE id=#{id}"
    conn.exec(sql)
  end

  def self.hydrate artists_data

    author = Author.new

    author.id = artists_data['id']
    author.first_name = artists_data['first_name']
    author.last_name = artists_data['last_name']
    author.dob = artists_data['dob']
    author.nationality = artists_data['nationality']
    author.periods = artists_data['periods']

    author


  end

end
