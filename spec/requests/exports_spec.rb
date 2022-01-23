require 'rails_helper'

RSpec.describe "Exports", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/exports/index"
      expect(response).to have_http_status(:success)
    end
  end

end
