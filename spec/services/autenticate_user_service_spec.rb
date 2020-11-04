require 'rails_helper'

describe AutenticateUserService do
  before(:each) do
    @user = User.create name: 'Pessoa', email: 'email@gmail.com', birth_date: '01/07/1997'.to_date, password: '123456', url: 'url'
  end

  it "is not authentic with incorrect password" do
    result = AutenticateUserService.new(login: { email: 'email@gmail.com', password: '666666' }).call
    expect(result.success?).to eq(false)
  end

  it "is not authentic with incorrect email" do
    result = AutenticateUserService.new(login: { email: 'aemail@gmail.com', password: '666666' }).call
    expect(result.success?).to eq(false)
  end

  it "is authentic" do
    result = AutenticateUserService.new(login: { email: 'email@gmail.com', password: '123456' }).call
    expect(result.success?).to eq(true)
  end

end