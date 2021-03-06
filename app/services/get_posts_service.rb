class GetPostsService

  def initialize params = {}
    @params = params[:filter].presence || {}
  end

  def call
    posts
  end

  def posts
    Post.select(:text, :user_id, 'posts.id', 'posts.created_at', 'users.name', 'users.url').joins(:user).where(filter).order(created_at: :desc)
  end

  def filter
    @params.slice(:user_id)
  end

end