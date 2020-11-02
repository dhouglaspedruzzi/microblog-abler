class HomeController < ApplicationController

  def index
    @posts = GetPostsService.new.call
  end

end