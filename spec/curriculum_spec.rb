require 'spec_helper'

describe 'Curriculum' do
  it "initializes Curriculum with an id, date, doctor_id, patient_id" do
    test_curriculum = Curriculum.new({id: 1, bootcamp_id: 1, technology_id: 1})
    expect(test_curriculum).to be_an_instance_of Curriculum
  end

  it "lets you read curriculum date and cost" do
    test_curriculum = Curriculum.new({id: 1, bootcamp_id: 1, technology_id: 1})
    expect(test_curriculum.bootcamp_id).to eq 1
  end

  it "starts with no curriculums" do
    expect(Curriculum.all).to eq []
  end

  it 'lets you save curriculum to the database' do
    test_curriculum = Curriculum.new({id: 1, bootcamp_id: 1, technology_id: 1})
    test_curriculum.save
    expect(Curriculum.all).to eq [test_curriculum]
  end

end
