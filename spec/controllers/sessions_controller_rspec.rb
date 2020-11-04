require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  render_views

  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
  end

  it "should success on create action" do
    post :create, params: { login: { email: 'email@gmail.com', password: '123456' } }, format: :js
    expect(response).to have_http_status(:success)
    expect(response.body).to include('/home')
  end

  it "should error on create action" do
    post :create, params: { login: { email: 'email@gmail.com', password: '456789' } }, format: :js
    expect(response).to have_http_status(:success)
    expect(response.body).to include('E-mail ou Senha incorreta, tente novamente.')
  end

  it "should error on create action" do
    session[:user_id] = @user.id
    get :destroy, format: :js
    expect(response).to have_http_status(:redirect)
  end

end