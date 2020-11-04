require 'rails_helper'

RSpec.describe ExploreController, type: :controller do

  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
  end

  it "returns http success" do
    get :index
    expect(response).to have_http_status(:success)

    get :search, params: { query: 'Test' }, format: :js
    expect(response).to have_http_status(:success)
    expect(assigns[:users].to_a).to eq([])
  end

end