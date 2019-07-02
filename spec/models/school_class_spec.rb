require 'rails_helper'

describe Schoolclass do
  before(:each) do
    @schoolclass = Schoolclass.create!(title: "Computer Science", room_number: 5)
  end

  it 'can be created' do
    expect(@schoolclass).to be_valid
  end

end