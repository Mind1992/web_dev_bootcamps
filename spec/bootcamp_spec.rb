require 'spec_helper'

describe 'Bootcamp' do 
	it 'initializes bootcamp with name and length_id' do 
		new_bootcamp = Bootcamp.new({name: 'Epicodus', length_id: nil})
	end
end