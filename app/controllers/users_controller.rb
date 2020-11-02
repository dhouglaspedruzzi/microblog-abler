class UsersController < ApplicationController

  def create
    respond_to do |format|
      result = CreateUserService.new(user: user_params).call
      format.html { redirect_to root_path, handle_message(result) }
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :birth_date, :email, :password, :password_confirmation)
  end

  def handle_message result
    if result.success?
      { notice: 'Conta criada com sucesso!' }
    else
      { alert: "Ocorreu um erro ao criar sua conta: #{ result.error }" }
    end
  end
end