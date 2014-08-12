require 'spec_helper'

describe 'Technology' do 
	it 'initializes technology with id and name' do 
		new_technology = Technology.new({name: 'Ruby'})
	end

	it "lets you read technologys' name" do 
		new_technology = Technology.new({name: 'Ruby'})
		expect(new_technology.name).to eq "Ruby"
	end

	it 'starts with no technologys' do 
		expect(Technology.all).to eq []
	end

	it 'lets you save technologys to the database' do
    new_technology = Technology.new({name: 'Ruby'})
    new_technology.save
    expect(Technology.all).to eq [new_technology]
  end

   it 'is the same technology if it has the same name and the same id' do
    new_technology = Technology.new({name: 'Ruby', id: 1})
    new_technology2 = Technology.new({name: 'Ruby', id: 1})
    expect(new_technology).to eq new_technology2
  end

  it 'sets its ID when you save it' do
    new_technology = Technology.new({name: 'Ruby', id: 1})
    new_technology.save
    expect(new_technology.id).to be_an_instance_of Fixnum
  end

  it "lets you search by name and get the id" do
    new_technology = Technology.new({name: 'Ruby', id: 1})
    new_technology_2 = Technology.new({name: 'JS', id: 2})
    new_technology.save
    new_technology_2.save
    expect(Technology.search_by_name('Ruby')).to eq new_technology.id
  end

  it "lets you update technologys' name" do
    new_technology = Technology.new({name: 'Ruby', id: 1})
    new_technology.save
    new_technology.update_name("JS", "Ruby")
    expect(Technology.all.first.name).to eq "JS"
  end

  it "lets you delete a Technology" do
    new_technology = Technology.new({name: 'Ruby', id: 1})
    new_technology_2 = Technology.new({name: 'JS', id: 2})
    new_technology.save
    new_technology_2.save
    new_technology.delete_technology("Ruby")
    expect(Technology.all).to eq [new_technology_2]
  end

end