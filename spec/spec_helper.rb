require 'rspec'
require 'pg'
require 'bootcamp'
require 'technology'

DB = PG.connect({:dbname => 'programming_bootcamps_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM bootcamps *')
    DB.exec('DELETE FROM technologies *')
  end
end