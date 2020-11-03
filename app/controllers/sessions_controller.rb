class SessionsController < ApplicationController
  skip_before_action :authorized, only: :create

  def create
    respond_to do |format|
      result = AutenticateUserService.new(login: login_params).call
      session[:user_id] = result.data.id.to_s if result.success?
      format.html { redirect_to home_index_path, handle_message(result) }
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def login_params
    params.require(:login).permit(:email, :password)
  end

  def handle_message result
    if result.success?
      { alert: result.error }
    end
  end
end
