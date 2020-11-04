require 'rails_helper'

describe ProfilesSearchService do
  before(:each) do
    @user_person = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
    @user_dhouglas = User.create name: 'Dhouglas', email: 'dhouglas@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url_2'
  end

  it 'should return users' do
    result = ProfilesSearchService.new.call
    expect(result.size).to eq(2)

    result = ProfilesSearchService.new(query: 'Dho').call
    expect(result.size).to eq(1)
    expect(result.first.name).to eq(@user_dhouglas.name)

    result = ProfilesSearchService.new(query: 'Pes').call
    expect(result.size).to eq(1)
    expect(result.first.name).to eq(@user_person.name)

    result = ProfilesSearchService.new(query: 'url').call
    expect(result.size).to eq(2)

    result = ProfilesSearchService.new(query: '_2').call
    expect(result.size).to eq(1)
    expect(result.first.name).to eq(@user_dhouglas.name)
  end


end