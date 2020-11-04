require 'rails_helper'

describe UpdateUserService do
  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
  end

  it "is valid" do
    result = UpdateUserService.new(user: { id: @user.id, name: 'Nova Pessoa' }).call
    expect(result.success?).to eq(true)
  end

  it 'is not valid' do
    result = UpdateUserService.new(user: { id: @user.id, name: '' }).call
    expect(result.success?).to eq(false)

    expect { UpdateUserService.new({}).call }.to raise_error(ActiveRecord::RecordNotFound)
  end
end