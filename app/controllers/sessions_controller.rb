class SessionsController < ApplicationController
  skip_before_action :authorized, only: :create

  def create
    result = AutenticateUserService.new(login: login_params).call

    if result.success?
      session[:user_id] = result.data.id.to_s
      redirect home_index_path
    else
      notify result.error
    end
  end

  def destroy
    session.delete(:user_id) if session
    redirect_to root_path
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)
  end
end
