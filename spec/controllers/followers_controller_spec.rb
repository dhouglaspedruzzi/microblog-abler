require 'rails_helper'

RSpec.describe FollowersController, type: :controller do

  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
    session[:user_id] = @user.id.to_s
    @user_to_follow = User.create name: 'Pessoa', email: 'email2@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url_2'
  end

  it "should success on handle action" do
    get :handle, params: { user_to_follow_id: @user_to_follow.id }, format: :js
    expect(response).to have_http_status(:success)
    expect(response.body).to eq({ status: :follow }.to_json)

    get :handle, params: { user_to_follow_id: @user_to_follow.id }, format: :js
    expect(response).to have_http_status(:success)
    expect(response.body).to eq({ status: :unfollow }.to_json)
  end

  it "should error on handle action" do
    get :handle, params: { user_to_follow_id: nil }, format: :js
    expect(response).to have_http_status(:success)
    expect(response.body).to eq({ status: :error, error: 'Usuário não encontrado!' }.to_json)
  end

end