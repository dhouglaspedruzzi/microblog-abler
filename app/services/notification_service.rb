class NotificationService

  def initialize params = {}
    @query_params = params[:query].presence || {}
    @order_params = params[:order].presence || {}
  end

  def call
    notifications
  end

  def notifications
    query = Notification.select(:id, :message, :read)
    query.where! @query_params if @query_params
    query = query.order @order_params if @order_params
    query
  end

end