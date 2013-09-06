require "spec_helper"

describe FavoriteImagesController do
  describe "routing" do

    it "routes to #index" do
      get("/favorite_images").should route_to("favorite_images#index")
    end

    it "routes to #new" do
      get("/favorite_images/new").should route_to("favorite_images#new")
    end

    it "routes to #show" do
      get("/favorite_images/1").should route_to("favorite_images#show", :id => "1")
    end

    it "routes to #edit" do
      get("/favorite_images/1/edit").should route_to("favorite_images#edit", :id => "1")
    end

    it "routes to #create" do
      post("/favorite_images").should route_to("favorite_images#create")
    end

    it "routes to #update" do
      put("/favorite_images/1").should route_to("favorite_images#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/favorite_images/1").should route_to("favorite_images#destroy", :id => "1")
    end

  end
end
