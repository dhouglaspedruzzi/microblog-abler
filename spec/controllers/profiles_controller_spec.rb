require 'rails_helper'

RSpec.describe ProfilesController, type: :controller do

  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
    session[:user_id] = @user.id.to_s
  end

  it "should success on index action" do
    get :index, params: { user_url: @user.url }
    expect(response).to have_http_status(:success)
  end

end