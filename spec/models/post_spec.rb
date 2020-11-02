require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456'
  end

  it 'is valid when user and text are informed' do
    post = Post.new user: @user, text: 'Post test'
    expect(post).to be_valid
  end

  it "is not valid when user or text aren't informed" do
    post = Post.new user: nil, text: 'Post test'
    post.valid?
    expect(post.errors[:user]).to include("é obrigatório(a)")

    post = Post.new user: @user, text: nil
    post.valid?
    expect(post.errors[:text]).to include("não pode ficar em branco")
  end
end
