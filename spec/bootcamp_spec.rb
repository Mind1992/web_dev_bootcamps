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

	it 'lets you save bootcamps to the database' do
    new_bootcamp = Bootcamp.new({name: "Epicodus", length_id: 1})
    new_bootcamp.save
    expect(Bootcamp.all).to eq [new_bootcamp]
  end

   it 'is the same bootcamp if it has the same name and the same id' do
    new_bootcamp = Bootcamp.new({name: "Epicodus", id: 1})
    new_bootcamp2 = Bootcamp.new({name: "Epicodus", id: 1})
    expect(new_bootcamp).to eq new_bootcamp2
  end

end