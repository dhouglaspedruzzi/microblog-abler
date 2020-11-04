require 'rails_helper'

RSpec.describe NotificationsController, type: :controller do

  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
    @notification = Notification.create user_id: @user.id, message: 'TEST'
    session[:user_id] = @user.id.to_s
  end

  it "should success on index action" do
    get :index
    expect(response).to have_http_status(:success)
  end

  it "should success on mark as read action" do
    get :mark_as_read, params: { notification_id: @notification.id }, format: :js
    expect(response).to have_http_status(:success)
  end

  it "should error on mark as read action" do
    get :mark_as_read, params: { notification_id: nil }, format: :js
    expect(response).to have_http_status(:success)
    expect(response.body).to eq({ status: :error, error: 'Notificação não encontrada!' }.to_json)
  end

  it "should success on get_new_count action" do
    get :get_new_count, format: :js
    expect(response).to have_http_status(:success)
    expect(response.body).to eq({ status: :success, count: 1 }.to_json)
  end

end