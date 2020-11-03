class MarkAsReadNotificationService

  def initialize notification_id
    @notification = Notification.find_by id: notification_id
  end

  def call
    return error if invalid_notification?
    mark_as_read
  end

  def mark_as_read
    OpenStruct.new success?: @notification.update(read: true), data: @notification, error: @notification.errors.full_messages
  end

  def invalid_notification?
    !@notification
  end

  def error
    OpenStruct.new success?: false, error: 'Notificação não encontrada!'
  end


end