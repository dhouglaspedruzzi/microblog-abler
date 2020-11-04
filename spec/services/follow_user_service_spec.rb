require 'rails_helper'

describe FollowUserService do
  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
    @user_to_follow = User.create name: 'Pessoa', email: 'email2@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url_2'
  end

  it 'should follow' do
    result = FollowUserService.new(@user.id, @user_to_follow.id).call
    expect(result.success?).to eq(true)
    expect(@user_to_follow.followers.count).to eq(1)

    result = FollowUserService.new(@user.id, @user_to_follow.id).call
    expect(result.success?).to eq(true)
    expect(@user_to_follow.followers.count).to eq(1)
  end

  it "shouldn't follow" do
    result = FollowUserService.new(@user.id, nil).call
    expect(result.success?).to eq(false)
    expect(result.error).to eq('Usuário não encontrado!')
  end
end