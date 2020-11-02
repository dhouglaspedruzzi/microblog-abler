class AutenticateUserService

  def initialize params={}
    @login_params = params[:login]
  end

  def call
    handle_result
  end

  private

  def authentic?
    user && user.authenticate(@login_params[:password])
  end

  def handle_result
    return OpenStruct.new success?: false, error: 'E-mail ou Senha incorreta, tente novamente.' unless authentic?
    OpenStruct.new success?: true, data: user
  end

  def user
    @user ||= User.find_by email: @login_params[:email]
  end
end