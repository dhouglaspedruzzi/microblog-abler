require 'rails_helper'

describe DeletePostService do
  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
    @post = Post.create user_id: @user.id, text: 'Teste'
  end

  it "is valid" do
    result = DeletePostService.new(@post.id).call
    expect(result.success?).to eq(true)
  end
end