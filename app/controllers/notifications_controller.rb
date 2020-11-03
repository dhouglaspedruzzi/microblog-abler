class NotificationsController < ApplicationController

  def index
    @notifications = NotificationService.new({ query: { user_id: current_user.id }, order: { id: :desc } }).call
  end

  def mark_as_read
    result = MarkAsReadNotificationService.new(prepared_params[:notification_id]).call

    if result.success?
      render json: { status: :success }
    else
      render json: { status: :error, error: result.error }
    end
  end

  def get_new_count
    notifications = NotificationService.new({ query: { user_id: current_user.id, read: false } }).call
    render json: { status: :success, count: notifications.size }
  end

  private

  def prepared_params
    params.permit(:notification_id)
  end


end