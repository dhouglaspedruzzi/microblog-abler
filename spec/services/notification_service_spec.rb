require 'rails_helper'

describe NotificationService do
  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
  end

  it 'should return notifications' do
    result = NotificationService.new.call
    expect(result.size).to eq(0)

    Notification.create user_id: @user.id, message: 'TESTE'
    result = NotificationService.new.call
    expect(result.size).to eq(1)
  end

  it 'should respect the filters' do
    Notification.create user_id: @user.id, message: 'TESTE', read: true
    Notification.create user_id: @user.id, message: 'TESTE', read: false
    result = NotificationService.new.call
    expect(result.size).to eq(2)

    result = NotificationService.new(query: { read: false }).call
    expect(result.size).to eq(1)

    result = NotificationService.new(query: { read: true }).call
    expect(result.size).to eq(1)
  end

  it 'should respect the order' do
    first_notification = Notification.create user_id: @user.id, message: 'TESTE'
    second_notification = Notification.create user_id: @user.id, message: 'TESTE'

    result = NotificationService.new(order: { id: :desc }).call
    expect(result.first.id).to eq(second_notification.id)
    expect(result.second.id).to eq(first_notification.id)
  end

end