class Length

  attr_accessor :id, :length

  def initialize(attributes)
    @id = attributes[:id]
    @length = attributes[:length]
  end

  def self.all
    results = DB.exec("SELECT * FROM lengths;")
    lengths = []
    results.each do |result|
      length = result['length'].to_i
      id = result['id'].to_i
      lengths << Length.new({length: length, id: id })
    end
    lengths
  end

  def save
    results = DB.exec("INSERT INTO lengths (length) VALUES (#{@length}) RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_length)
   self.id == another_length.id
  end

    def self.search_by_name(name)
    Length.all.detect { |length| length.length == name }.id
  end
end
