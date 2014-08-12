require 'spec_helper'

describe 'Bootcamp' do 
	it 'initializes bootcamp with id, name and length_id' do 
		new_bootcamp = Bootcamp.new({name: 'Epicodus', length_id: nil})
	end

	it "lets you read bootcamps' name" do 
		new_bootcamp = Bootcamp.new({name: 'Epicodus', length_id: nil})
		expect(new_bootcamp.name).to eq "Epicodus"
	end

	it 'starts with no bootcamps' do 
		expect(Bootcamp.all).to eq []
	end
end