require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
    session[:user_id] = @user.id.to_s
  end

  it "should success" do
    get :index
    expect(response).to have_http_status(:success)
  end

end