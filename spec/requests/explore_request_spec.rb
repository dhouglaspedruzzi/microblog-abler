require 'rails_helper'

RSpec.describe "Explores", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/explore/index"
      expect(response).to have_http_status(:success)
    end
  end

end
