require 'rails_helper'

describe MarkAsReadNotificationService do
  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
  end

  it "should mark as read" do
    notification = Notification.create user_id: @user.id, message: 'TESTE'
    result = MarkAsReadNotificationService.new(notification.id).call
    expect(result.success?).to eq(true)
  end

  it "should return error" do
    result = MarkAsReadNotificationService.new(nil).call
    expect(result.success?).to eq(false)
    expect(result.error).to eq('Notificação não encontrada!')
  end
end