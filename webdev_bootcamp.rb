require 'pg'
require './lib/bootcamp'
require './lib/technology'
require './lib/curriculum'


PG.connect({:dbname => 'programming_bootcamps'})

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
      when '8' then exit
      else
        puts 'This is the wrong command'
    end
  end
end

main_menu
