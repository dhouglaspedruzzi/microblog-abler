class UsersController < ApplicationController
  skip_before_action :authorized, only: :create

  def create
    respond_to do |format|
      result = CreateUserService.new(user: user_params).call
      format.html { redirect_to root_path, handle_message(result) }
    end
  end

  def update
    respond_to do |format|
      result = UpdateUserService.new(user: user_params).call
      format.html { redirect_to profile_index_path(result.data.url), handle_message(result) }
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :birth_date, :email, :password, :password_confirmation, :avatar, :bio)
  end

  def handle_message result
    if result.success?
      { notice: 'Conta criada com sucesso!' }
    else
      { alert: "Ocorreu um erro ao criar sua conta: #{ result.error }" }
    end
  end
end