class Technology

	attr_accessor :id, :name

	def initialize(attributes)
		@id = attributes[:id]
		@name = attributes[:name]
	end

	def self.all
    results = DB.exec("SELECT * FROM technologies;")
    technologies = []
    results.each do |result|
      name = result['name']
      id = result['id'].to_i
      technologies << Technology.new({name: name, id: id })
    end
    technologies
  end

  def save
    results = DB.exec("INSERT INTO technologies (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_technology)
    self.name == another_technology.name && self.id == another_technology.id
  end

  def self.search_by_name(name)
    Technology.all.detect { |technology| technology.name == name }.id
  end

  def update_name(new_name, old_name)
   found_id = Technology.search_by_name(old_name)
   DB.exec("UPDATE technologies SET name = '#{new_name}' WHERE id = #{found_id};")
   self.name = new_name
  end

   def delete_technology(name)
    technology = Technology.search_by_name(name)
    DB.exec("DElETE FROM technologies WHERE id = #{technology};")
    Technology.all.delete(Technology.all.first)
  end
end