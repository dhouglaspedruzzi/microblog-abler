require 'rails_helper'

describe CreateNotificationService do
  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456'
  end

  it 'should create' do
    result = CreateNotificationService.new(@user.id, 'Mensagem').call
    expect(result.success?).to eq(true)
    expect(@user.notifications.count).to eq(1)

    result = CreateNotificationService.new(@user.id, 'Mensagem').call
    expect(result.success?).to eq(true)
    expect(@user.notifications.count).to eq(2)
  end
end