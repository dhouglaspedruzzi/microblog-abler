require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  render_views

  it "should success on create action" do
    get :create, params: { user: { name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', password_confirmation: '123456' } }, format: :js
    expect(response).to have_http_status(:success)
    expect(response.body).to include('/')
  end

  it "should error on create action" do
    get :create, params: { user: { name: '', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', password_confirmation: '123456' } }, format: :js
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Nome não pode ficar em branco')
  end

  it "should success on update action" do
    user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', password_confirmation: '123456', url: 'url'
    session[:user_id] = user.id.to_s
    put :update, params: { user: { id: user.id, name: 'Pessoa' }, id: user.id }, format: :js
    expect(response).to have_http_status(:success)
    expect(response.body).to include("/p/#{ user.url }")
  end

  it "should error on update action" do
    user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', password_confirmation: '123456', url: 'url'
    session[:user_id] = user.id.to_s
    put :update, params: { user: { id: user.id, name: '' }, id: user.id }, format: :js
    expect(response).to have_http_status(:success)
    expect(response.body).to include('Nome não pode ficar em branco')
  end

end