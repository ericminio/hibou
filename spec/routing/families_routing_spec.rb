require "spec_helper"

describe FamiliesController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/families" }.should route_to(:controller => "families", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/families/new" }.should route_to(:controller => "families", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/families/1" }.should route_to(:controller => "families", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/families/1/edit" }.should route_to(:controller => "families", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/families" }.should route_to(:controller => "families", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/families/1" }.should route_to(:controller => "families", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/families/1" }.should route_to(:controller => "families", :action => "destroy", :id => "1")
    end

  end
end
