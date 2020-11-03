class ProfilesController < ApplicationController

  def profile
    @user_profile = User.find_by url: params[:user_url]
    @posts = GetPostsService.new(filter: { user_id: @user_profile.id }).call
  end

end