class UnfollowUserService

  def initialize user_id, user_to_unfollow_id
    @user = User.find_by id: user_id
    @user_to_unfollow = User.find_by id: user_to_unfollow_id
  end

  def call
    return OpenStruct.new success?: false, error: 'Usuário não encontrado!' unless @user && @user_to_unfollow
    follower = @user_to_unfollow.followers.find_by follower_id: @user.id

    return OpenStruct.new success?: true unless follower

    follower.destroy
    handle_result follower
  end

  def handle_result follower
    return OpenStruct.new success?: false, error: follower.errors.full_messages.join(', ') if follower.errors.present?
    OpenStruct.new success?: true, data: follower
  end

end