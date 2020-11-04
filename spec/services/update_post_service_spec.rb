require 'rails_helper'

describe UpdatePostService do
  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
    @post = Post.create user_id: @user.id, text: 'Teste'
  end

  it "is valid" do
    result = UpdatePostService.new(post: { text: 'Novo post', id: @post.id }).call
    expect(result.success?).to eq(true)
  end

  it 'is not valid' do
    result = UpdatePostService.new(post: { text: '', id: @post.id }).call
    expect(result.success?).to eq(false)
  end
end