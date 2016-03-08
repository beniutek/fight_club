require 'rails_helper'

RSpec.describe "Fights", type: :request do
  describe "GET /fights" do
    it "works! (now write some real specs)" do
      get fights_path
      expect(response).to have_http_status(200)
    end
  end
end
