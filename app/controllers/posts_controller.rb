class PostsController < ApplicationController

  def create
    result = CreatePostService.new(post: post_params.merge(user_id: current_user&.id)).call

    if result.success?
      redirect home_index_path, notice: 'Criado com sucesso!'
    else
      notify result.error
    end
  end

  private

  def post_params
    params.require(:post).permit(:text)
  end

end