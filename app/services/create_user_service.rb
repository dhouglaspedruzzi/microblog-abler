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
    @user = User.create @user_params.merge(url: build_url)
  end

  def handle_result
    return OpenStruct.new success?: false, error: @user.errors.full_messages.join("\n") if @user.errors.present?
    OpenStruct.new success?: true, data: @user
  end

  def build_url
    new_url = @user_params[:name].to_s.gsub(/\s+/, '').underscore
    count = User.select(:id).where(url: new_url).count
    "#{ new_url }#{ "_#{ count }" if count.positive? }"
  end

end