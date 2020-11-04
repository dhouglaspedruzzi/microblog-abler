class UpdateUserService

  def initialize params={}
    @user_params = params[:user]
  end

  def call
    update_user
    handle_result
  end

  private

  def update_user
    @user = User.find @user_params[:id]
    @user.attributes = @user_params
    @user.save
  end

  def handle_result
    return OpenStruct.new success?: false, error: @user.errors.full_messages.join("\n") if @user.errors.present?
    OpenStruct.new success?: true, data: @user
  end
end