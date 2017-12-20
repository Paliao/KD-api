require "rails_helper"

RSpec.describe EstablishmentsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/establishments").to route_to("establishments#index")
    end


    it "routes to #show" do
      expect(:get => "/establishments/1").to route_to("establishments#show", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/establishments").to route_to("establishments#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/establishments/1").to route_to("establishments#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/establishments/1").to route_to("establishments#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/establishments/1").to route_to("establishments#destroy", :id => "1")
    end

  end
end
