class FollowUserService

  def initialize user_id, user_to_follow_id
    @user = User.find_by id: user_id
    @user_to_follow = User.find_by id: user_to_follow_id
  end

  def call
    return OpenStruct.new success?: false, error: 'Usuário não encontrado!' unless @user && @user_to_follow
    follower = @user_to_follow.followers.find_or_initialize_by follower_id: @user.id

    if follower.save
      CreateNotificationService.new(@user_to_follow.id, "#{ @user.name } - p/#{ @user.url } seguiu você!").call
      OpenStruct.new success?: true, data: follower
    else
      OpenStruct.new success?: false, error: follower.errors.full_messages.join(', ')
    end
    handle_result follower
  end

  def handle_result follower
    return OpenStruct.new success?: false, error: follower.errors.full_messages.join(', ') if follower.errors.present?
    OpenStruct.new success?: true, data: follower
  end

end