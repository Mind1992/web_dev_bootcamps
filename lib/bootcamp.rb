class Bootcamp

	attr_accessor :id, :name, :length_id

	def initialize(attributes)
		@id = attributes[:id]
		@name = attributes[:name]
		@length_id = attributes[:length_id]
	end

	def self.all
    results = DB.exec("SELECT * FROM bootcamps;")
    bootcamps = []
    results.each do |result|
      name = result['name']
      length_id = result['length'].to_i
      id = result['id'].to_i
      bootcamps << Bootcamp.new({name: name, length_id: length_id, id: id })
    end
    bootcamps
  end

  def save
    results = DB.exec("INSERT INTO bootcamps (name, length_id) VALUES ('#{@name}', #{@length_id}) RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_bootcamp)
    self.name == another_bootcamp.name && self.id == another_bootcamp.id
  end

  def self.search_by_name(name)
    Bootcamp.all.detect { |bootcamp| bootcamp.name == name }.id
  end

  def self.search_for_object(name)
    Bootcamp.all.detect { |bootcamp| bootcamp.name == name }
  end

  def update_name(new_name, old_name)
   found_id = Bootcamp.search_by_name(old_name)
   DB.exec("UPDATE bootcamps SET name = '#{new_name}' WHERE id = #{found_id};")
   self.name = new_name
  end

   def delete_bootcamp(name)
    bootcamp = Bootcamp.search_by_name(name)
    DB.exec("DELETE FROM bootcamps WHERE id = #{bootcamp};")
    Bootcamp.all.delete(Bootcamp.all.first)
  end

end
