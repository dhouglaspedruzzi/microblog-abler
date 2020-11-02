class CreateUserService

  def initialize params={}
    @user_params = params[:user]
  end

  def call
    create_user
    handle_result
  end

  private

  def create_user
    @user = User.create @user_params
  end

  def handle_result
    return OpenStruct.new success?: false, error: @user.errors.full_messages.join(', ') if @user.errors.present?
    OpenStruct.new success?: true, data: @user
  end
end