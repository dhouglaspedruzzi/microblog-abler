require 'rails_helper'

RSpec.describe Follower, type: :model do
  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'pessoa'
    @user_follower = User.create name: 'Pessoa 2', email: 'email2@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'pessoa_1'
  end

  it 'is valid' do
    follower = Follower.new user_id: @user.id, follower_id: @user_follower.id
    expect(follower).to be_valid
  end

  it "is not valid" do
    follower = Follower.create user_id: @user.id, follower_id: nil
    expect(follower.errors[:follower_id]).to include("não pode ficar em branco")

    follower = Follower.create user_id: nil, follower_id: @user_follower.id
    expect(follower.errors[:user_id]).to include("não pode ficar em branco")
  end
end
