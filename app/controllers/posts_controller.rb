class PostsController < ApplicationController
  protect_from_forgery except: [:create, :edit]

  def create
    result = CreatePostService.new(post: post_params.merge(user_id: current_user&.id)).call

    if result.success?
      redirect home_index_path, notice: 'Criado com sucesso!'
    else
      notify result.error
    end
  end

  def edit
    @post = Post.find params[:id]
    @controller_to_redirect = params[:controller_to_redirect]
  end

  def update
    result = UpdatePostService.new(post: post_params.merge(user_id: current_user&.id)).call

    if result.success?
      redirect controller_to_redirect, notice: 'Salvo com sucesso!'
    else
      notify result.error
    end
  end

  def destroy
    DeletePostService.new(params[:id]).call
    render json: { status: :success }
  end

  private

  def post_params
    params.require(:post).permit(:id, :text)
  end

  def controller_to_redirect
    params[:controller_to_redirect].presence || home_index_path
  end

end