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

  it 'sets its ID when you save it' do
    new_bootcamp = Bootcamp.new({name: "Epicodus", length_id: 1})
    new_bootcamp.save
    expect(new_bootcamp.id).to be_an_instance_of Fixnum
  end

  it "lets you search by name and get the id" do
    new_bootcamp = Bootcamp.new({name: "Epicodus",length_id: 1})
    new_bootcamp_2 = Bootcamp.new({name: "Code Fellows",length_id: 2})
    new_bootcamp.save
    new_bootcamp_2.save
    expect(Bootcamp.search_by_name('Epicodus')).to eq new_bootcamp.id
  end

  it "lets you update bootcamps' name" do
    new_bootcamp = Bootcamp.new({name: "Epicodus",length_id: 1})
    new_bootcamp.save
    new_bootcamp.update_name("Code Fellows", "Epicodus")
    expect(Bootcamp.all.first.name).to eq "Code Fellows"
  end

  it "lets you delete a bootcamp" do
    new_bootcamp = Bootcamp.new({name: "Epicodus",length_id: 1})
    new_bootcamp_2 = Bootcamp.new({name: "Code Fellows",length_id: 2})
    new_bootcamp.save
    new_bootcamp_2.save
    new_bootcamp.delete_bootcamp("Epicodus")
    expect(Bootcamp.all).to eq [new_bootcamp_2]
  end

end