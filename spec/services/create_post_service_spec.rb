require 'rails_helper'

describe CreatePostService do
  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
  end

  it "is not valid if don't have all needed information" do
    result = CreatePostService.new(post: {}).call
    expect(result.success?).to eq(false)
  end

  it "is valid if have all needed information" do
    result = CreatePostService.new(post: { user_id: @user.id, text: 'test' }).call
    expect(result.success?).to eq(true)
  end
end