class ExploreController < ApplicationController
  def index; end

  def search
    @users = ProfilesSearchService.new(query: params[:query]).call
  end
end
