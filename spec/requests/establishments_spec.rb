require 'rails_helper'

RSpec.describe "Establishments", type: :request do
  describe "GET /establishments" do
    it "works! (now write some real specs)" do
      get establishments_path
      expect(response).to have_http_status(200)
    end
  end
end
