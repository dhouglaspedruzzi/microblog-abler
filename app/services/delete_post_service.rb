class DeletePostService

  def initialize post_id
    @post_id = post_id
  end

  def call
    delete_post
    handle_result
  end

  private

  def delete_post
    Post.find(@post_id).destroy
  end

  def handle_result
    OpenStruct.new success?: true, data: @post
  end
end