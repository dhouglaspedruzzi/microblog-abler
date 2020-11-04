require 'rails_helper'

describe GetPostsService do
  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
  end

  it "should return posts" do
    expect(GetPostsService.new.call.size).to eq(0)
    CreatePostService.new(post: { user_id: @user.id, text: 'test' }).call
    expect(GetPostsService.new.call.size).to eq(1)
  end
end