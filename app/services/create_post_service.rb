class CreatePostService

  def initialize params={}
    @post_params = params[:post]
  end

  def call
    create_post
    handle_result
  end

  private

  def create_post
    @post = Post.create @post_params
  end

  def handle_result
    return OpenStruct.new success?: false, error: @post.errors.full_messages.join(', ') if @post.errors.present?
    OpenStruct.new success?: true, data: @post
  end
end