require "rails_helper"

RSpec.describe FightsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/fights").to route_to("fights#index")
    end

    it "routes to #new" do
      expect(:get => "/fights/new").to route_to("fights#new")
    end

    it "routes to #show" do
      expect(:get => "/fights/1").to route_to("fights#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/fights/1/edit").to route_to("fights#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/fights").to route_to("fights#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/fights/1").to route_to("fights#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/fights/1").to route_to("fights#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/fights/1").to route_to("fights#destroy", :id => "1")
    end

  end
end
