require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  render_views

  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
    @post = Post.create user_id: @user.id, text: 'Teste'
    session[:user_id] = @user.id.to_s
  end

  it "should success on create action" do
    get :create, params: { post: { text: 'Post Test' } }, format: :js
    expect(response).to have_http_status(:success)
    expect(response.body).to include('/home')
  end

  it 'should error on create action' do
    get :create, params: { post: { text: '' } }, format: :js
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Postagem não pode ficar em branco')
  end

  it "should success on update action" do
    put :update, params: { post: { id: @post.id, text: 'Post Test', controller_to_redirect: 'home' }, id: @post.id }, format: :js
    expect(response).to have_http_status(:success)
    expect(response.body).to include('/home')
  end

  it "should error on update action" do
    put :update, params: { post: { id: @post.id, text: '', controller_to_redirect: 'home' }, id: @post.id }, format: :js
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Postagem não pode ficar em branco')
  end

  it "should success on edit action" do
    get :edit, params: { id: @post.id }, format: :js
    expect(response).to have_http_status(:success)
  end

  it "should success on destroy action" do
    delete :destroy, params: { id: @post.id }
    expect(response).to have_http_status(:success)
  end

end