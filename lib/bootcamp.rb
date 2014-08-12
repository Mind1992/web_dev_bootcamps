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
end