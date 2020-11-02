class ProfilesController < ApplicationController

  def profile
    @user = User.find_by url: params[:user_url]
    @posts = GetPostsService.new(filter: { user_id: @user.id }).call
  end

end