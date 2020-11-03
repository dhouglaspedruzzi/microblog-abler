class ProfilesSearchService

  def initialize params = {}
    @query = params[:query]
  end

  def call
    profiles
  end

  def profiles
    query = User.select(:id, :name, :url)
    query.where! 'name ilike :query OR url ilike :query', query: "%#{ @query }%"
    query
  end

end