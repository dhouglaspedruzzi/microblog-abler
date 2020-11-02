class PostsController < ApplicationController

  def create
    respond_to do |format|
      result = CreatePostService.new(post: post_params.merge(user_id: current_user&.id)).call
      format.html { redirect_to root_path, handle_message(result) }
    end
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end

  def handle_message result
    if result.success?
      { notice: 'Criado com sucesso!' }
    else
      { alert: result.error }
    end
  end

end