require 'rails_helper'

RSpec.describe "Fighters", type: :request do
  describe "GET /fighters" do
    it "works! (now write some real specs)" do
      get fighters_path
      expect(response).to have_http_status(200)
    end
  end
end
