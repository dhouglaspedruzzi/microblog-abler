require 'rails_helper'

describe CreateUserService do
  it "is not valid if don't have all needed information" do
    result = CreateUserService.new(user: {}).call
    expect(result.success?).to eq(false)
  end

  it "is valid if have all needed information" do
    result = CreateUserService.new(user: { email: 'email@teste.com', name: 'Person', password: '123456', password_confirmation: '123456', birth_date: '01/10/1997' }).call
    expect(result.success?).to eq(true)
  end

  it "is not valid if password doesn't match with password_confirmation" do
    result = CreateUserService.new(user: { email: 'email@teste.com', name: 'Person', password: '123456', password_confirmation: '456789', birth_date: '01/10/1997' }).call
    expect(result.success?).to eq(false)
  end
end