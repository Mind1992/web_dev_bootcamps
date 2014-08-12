class Bootcamp

	attr_accessor :id, :name, :length_id

	def initialize(attributes)
		@id = attributes[:id]
		@name = attributes[:name]
		@length_id = attributes[:length_id]
	end
end