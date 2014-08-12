require 'rspec'
require 'pg'
require 'bootcamp'
require 'technology'
require 'curriculum'
require 'length'

DB = PG.connect({:dbname => 'programming_bootcamps_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec('DELETE FROM bootcamps *')
    DB.exec('DELETE FROM technologies *')
    DB.exec('DELETE FROM curriculum *')
    DB.exec('DELETE FROM lengths')
  end
end
