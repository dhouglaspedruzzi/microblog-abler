class UsersController < ApplicationController
  skip_before_action :authorized, only: :create
  protect_from_forgery except: :create

  def create
    result = CreateUserService.new(user: user_params).call

    if result.success?
      redirect root_path, notice: 'Usuário salvo com sucesso'
    else
      notify result.error
    end
  end

  def update
    result = UpdateUserService.new(user: user_params).call

    if result.success?
      redirect profile_index_path(result.data.url), notice: 'Usuário salvo com sucesso'
    else
      notify result.error
    end
  end

  private

  def user_params
    params.require(:user).permit(:id, :name, :birth_date, :email, :password, :password_confirmation, :avatar, :bio)
  end
end