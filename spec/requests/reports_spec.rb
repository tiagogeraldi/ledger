require 'rails_helper'

RSpec.describe "Reports", type: :request do
  describe "GET /balance" do
    it "returns http success" do
      get "/reports/balance"
      expect(response).to have_http_status(302)
    end
  end

end
