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
    puts "1: add bootcamp"
    puts "2: list bootcamps"
    puts "3: update bootcamps' name"
    puts "4: delete bootcamp"
    puts "5: add a technology to the bootcamp"
    puts "6: list all bootcamps by technology"
    puts "7: list all bootcamps by length"
    puts "8: exit"
    input = gets.chomp
    case input
      when '1' then add_bootcamp
      when '2' then list_bootcamps
      when '3' then update_bootcamp
      when '4' then delete_bootcamp
      when '5' then add_technology
      when '6' then find_by_technology
      when '7' then find_by_length
      when '8' then DB.exec("DROP ")
      else
        puts 'This is the wrong command'
    end
  end
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

main_menu
