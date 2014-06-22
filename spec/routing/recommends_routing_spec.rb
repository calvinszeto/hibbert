require "rails_helper"

RSpec.describe RecommendsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/recommends").to route_to("recommends#index")
    end

    it "routes to #new" do
      expect(:get => "/recommends/new").to route_to("recommends#new")
    end

    it "routes to #show" do
      expect(:get => "/recommends/1").to route_to("recommends#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/recommends/1/edit").to route_to("recommends#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/recommends").to route_to("recommends#create")
    end

    it "routes to #update" do
      expect(:put => "/recommends/1").to route_to("recommends#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/recommends/1").to route_to("recommends#destroy", :id => "1")
    end

  end
end
