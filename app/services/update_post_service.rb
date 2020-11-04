class UpdatePostService

  def initialize params={}
    @post_params = params[:post]
  end

  def call
    update_post
    handle_result
  end

  private

  def update_post
    @post = Post.find @post_params[:id]
    @post.attributes = @post_params
    @post.save
  end

  def handle_result
    return OpenStruct.new success?: false, error: @post.errors.full_messages.join("\n") if @post.errors.present?
    OpenStruct.new success?: true, data: @post
  end
end