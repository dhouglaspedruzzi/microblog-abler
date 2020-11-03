class CreateNotificationService

  def initialize user_id, message
    @user = User.find_by id: user_id
    @message = message
  end

  def call
    OpenStruct.new success?: false, error: 'Usuário não encontrado!' unless @user
    send_notification
  end

  def send_notification
    notification = @user.notifications.create message: @message

    if notification.valid?
      OpenStruct.new success?: true, data: notification
    else
      OpenStruct.new success?: false, error: notification.errors.full_messages.join(', ')
    end
  end

end