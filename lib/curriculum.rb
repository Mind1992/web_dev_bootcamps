
class Curriculum

  attr_accessor :id, :bootcamp_id, :technology_id

  def initialize(attributes)
    @id = attributes[:id]
    @bootcamp_id = attributes[:bootcamp_id]
    @technology_id = attributes[:technology_id]
  end

  def self.all
    results = DB.exec("SELECT * FROM curriculum;")
    curriculum = []
    results.each do |result|
      id = result['id'].to_i
      bootcamp_id = result['bootcamp_id']
      technology_id = result['technology_id']
      curriculum << Curriculum.new({id: id, bootcamp_id: bootcamp_id, technology_id: technology_id})
    end
    curriculum
  end

  def save
    results = DB.exec("INSERT INTO curriculum (bootcamp_id, technology_id) VALUES (#{@bootcamp_id}, #{technology_id}) RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_curriculum)
    self.id == another_curriculum.id
  end


end
