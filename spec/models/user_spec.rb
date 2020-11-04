require 'rails_helper'

describe User, type: :model do
  it 'is valid when name, birth_date, email and password are present' do
    user = User.new name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
    expect(user).to be_valid
  end

  it 'is not valid when name, birth_date, email and password are empty' do
    user = User.new name: nil, email: nil, birth_date: nil, password: nil, url: nil
    user.valid?
    expect(user.errors[:name]).to include("não pode ficar em branco")
    expect(user.errors[:email]).to include("não pode ficar em branco")
    expect(user.errors[:birth_date]).to include("não pode ficar em branco")
    expect(user.errors[:password]).to include("não pode ficar em branco")
    expect(user.errors[:url]).to include("não pode ficar em branco")
  end

  it 'is not valid when there are more than one email or url' do
    User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
    user = User.new name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
    user.valid?
    expect(user.errors[:email]).to include("já está em uso")
    expect(user.errors[:url]).to include("já está em uso")
  end
end