require 'spec_helper'

describe 'Length' do
  it "initializes length with an id and length" do
    test_length = Length.new({id: 1, length: 12})
    expect(test_length).to be_an_instance_of Length
  end

  it "lets you read length date and cost" do
    test_length = Length.new({id: 1, length: 12})
    expect(test_length.length).to eq 12
  end

  it "starts with no lengths" do
    expect(Length.all).to eq []
  end

  it 'lets you save length to the database' do
    test_length = Length.new({id: 1, length: 12})
    test_length.save
    expect(Length.all).to eq [test_length]
  end

  it 'sets its ID when you save it' do
    new_length = Length.new({length: 18, id: 1})
    new_length.save
    expect(new_length.id).to be_an_instance_of Fixnum
  end

end
