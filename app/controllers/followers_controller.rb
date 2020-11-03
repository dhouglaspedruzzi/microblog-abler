class FollowersController < ApplicationController

  def handle
    if current_user.is_following? params[:user_to_follow_id]
      unfollow
    else
      follow
    end
  end

  private

  def follow
    result = FollowUserService.new(current_user.id, params[:user_to_follow_id]).call
    if result.success?
      render json: { status: :follow }
    else
      render json: { status: :error, error: result.error }
    end
  end

  def unfollow
    result = UnfollowUserService.new(current_user.id, params[:user_to_follow_id]).call
    if result.success?
      render json: { status: :unfollow }
    else
      render json: { status: :error, error: result.error }
    end
  end


end