class ExploreController < ApplicationController
  skip_before_action :authorized, only: [:index, :search]

  def index; end

  def search
    @users = ProfilesSearchService.new(query: params[:query]).call
  end
end
