require 'pg'
require './lib/bootcamp'
require './lib/technology'
require './lib/curriculum'
require './lib/length'
require 'pry'

DB = PG.connect({:dbname => 'programming_bootcamps'})

def main_menu
  loop do
    puts "*** Commands ***"
    puts "0: add length"
    puts "1: add bootcamp"
    puts "2: list bootcamps"
    puts "3: update bootcamps' name"
    puts "4: delete bootcamp"
    puts "5: add a technology"
    puts "6: list technologies"
    puts "7: add a technology to bootcamp"
    puts "8: list all bootcamps by technology"
    puts "9: list all bootcamps by length"
    puts "10: exit"
    input = gets.chomp
    case input
      when '0' then add_length
      when '1' then add_bootcamp
      when '2' then list_bootcamps
      when '3' then update_bootcamp
      when '4' then delete_bootcamp
      when '5' then add_technology
      when '6' then list_technologies
      when '7' then add_technology_to_bootcamp
      when '8' then find_by_technology
      when '9' then find_by_length
      when '10' then exit
      else
        puts 'This is the wrong command'
    end
  end
end

def add_length
  print "Add length in weeks: "; length = gets.chomp.to_i
  new_length = Length.new({length: length})
  new_length.save
  puts "New bootcamp #{new_length.length} was added"
end

def add_bootcamp
  print "Add bootcamps' name: "; bootcamp_name = gets.chomp
  print "Add bootcamps' length: "; bootcamp_length = gets.chomp
  length_id = Length.search_by_name(bootcamp_length.to_i)
  new_bootcamp = Bootcamp.new({name: bootcamp_name, length_id: length_id })
  new_bootcamp.save
  puts "New bootcamp #{new_bootcamp.name} was added"
end

def list_bootcamps
  puts "*** Bootcamps ***"
  Bootcamp.all.each do |bootcamp|
    puts bootcamp.name
  end
end

def update_bootcamp
  list_bootcamps
  puts "Which bootcamps' name you would like to change: "
  old_name = gets.chomp
  puts "Type in the new name: "
  new_name = gets.chomp
  bootcamp_object = Bootcamp.search_for_object(old_name)
  bootcamp_object.update_name(new_name, old_name)
  list_bootcamps
end

def delete_bootcamp
  list_bootcamps
  puts "Which bootcamp would you like to delete: "
  name = gets.chomp
  bootcamp_object = Bootcamp.search_for_object(name)
  bootcamp_object.delete_bootcamp(name)
  list_bootcamps
end

def add_technology
  print "Add a new technology: "; technology_name = gets.chomp
  new_technology = Technology.new({name: technology_name})
  new_technology.save
  puts "New technology #{new_technology.name} was added"
end

def list_technologies
  puts "*** Technologies ***"
  Technology.all.each do |technology|
    puts technology.name
  end
end

def add_technology_to_bootcamp
  list_bootcamps
  print "Choose a bootcamp to add a technology: "; bootcamp_name = gets.chomp
  bootcamp_id = Bootcamp.search_by_name(bootcamp_name)
  list_technologies
  print "Choose a technology to add to: "; technology_name = gets.chomp
  technology_id = Technology.search_by_name(technology_name)
  new_curriculum = Curriculum.new({bootcamp_id: bootcamp_id, technology_id: technology_id})
  new_curriculum.save
  puts "New curriculum was added"
end


main_menu
