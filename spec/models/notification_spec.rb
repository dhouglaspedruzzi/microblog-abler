require 'rails_helper'

RSpec.describe Notification, type: :model do
  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'pessoa'
  end

  it 'is valid' do
    notification = Notification.new user_id: @user.id, message: 'TESTE'
    expect(notification).to be_valid
  end

  it "is not valid" do
    notification = Notification.create user_id: @user.id, message: nil
    expect(notification.errors[:message]).to include("não pode ficar em branco")

    notification = Notification.create user_id: nil, message: 'TESTE'
    expect(notification.errors[:user_id]).to include("não pode ficar em branco")
  end
end
