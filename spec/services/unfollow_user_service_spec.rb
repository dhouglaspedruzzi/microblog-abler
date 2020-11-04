require 'rails_helper'

describe UnfollowUserService do
  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
    @user_to_follow = User.create name: 'Pessoa', email: 'email2@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url_2'
    @user_to_follow.followers.create follower_id: @user.id
  end

  it 'should unfollow' do
    expect(@user_to_follow.followers.count).to eq(1)
    result = UnfollowUserService.new(@user.id, @user_to_follow.id).call
    expect(result.success?).to eq(true)
    expect(@user_to_follow.followers.count).to eq(0)

    result = UnfollowUserService.new(@user.id, @user_to_follow.id).call
    expect(result.success?).to eq(true)
    expect(@user_to_follow.followers.count).to eq(0)
  end

  it "shouldn't unfollow" do
    result = UnfollowUserService.new(@user.id, nil).call
    expect(result.success?).to eq(false)
    expect(result.error).to eq('Usuário não encontrado!')
  end
end