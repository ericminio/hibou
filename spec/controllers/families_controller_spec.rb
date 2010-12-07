require 'spec_helper'

describe FamiliesController do

  before :each do
    @user = User.create(
        :email => "elvis@memphis.te",
        :password => "hunhun",
        :password_confirmation => "hunhun"
    )
    sign_in @user
  end

  def mock_family(stubs={})
    (@mock_family ||= mock_model(Family).as_null_object).tap do |family|
      family.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all families as @families" do
      Family.stub(:all) { [mock_family] }
      get :index
      assigns(:families).should eq([mock_family])
    end
  end

  describe "GET show" do
    it "assigns the requested family as @family" do
      Family.stub(:find).with("37") { mock_family }
      get :show, :id => "37"
      assigns(:family).should be(mock_family)
    end
  end

  describe "GET new" do
    it "assigns a new family as @family" do
      Family.stub(:new) { mock_family }
      get :new
      assigns(:family).should be(mock_family)
    end
  end

  describe "GET edit" do
    it "assigns the requested family as @family" do
      Family.stub(:find).with("37") { mock_family }
      get :edit, :id => "37"
      assigns(:family).should be(mock_family)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created family as @family" do
        Family.stub(:new).with({'these' => 'params'}) { mock_family(:save => true) }
        post :create, :family => {'these' => 'params'}
        assigns(:family).should be(mock_family)
      end

      it "redirects to the created family" do
        Family.stub(:new) { mock_family(:save => true) }
        post :create, :family => {}
        response.should redirect_to(family_url(mock_family))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved family as @family" do
        Family.stub(:new).with({'these' => 'params'}) { mock_family(:save => false) }
        post :create, :family => {'these' => 'params'}
        assigns(:family).should be(mock_family)
      end

      it "re-renders the 'new' template" do
        Family.stub(:new) { mock_family(:save => false) }
        post :create, :family => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested family" do
        Family.should_receive(:find).with("37") { mock_family }
        mock_family.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :family => {'these' => 'params'}
      end

      it "assigns the requested family as @family" do
        Family.stub(:find) { mock_family(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:family).should be(mock_family)
      end

      it "redirects to the family" do
        Family.stub(:find) { mock_family(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(family_url(mock_family))
      end
    end

    describe "with invalid params" do
      it "assigns the family as @family" do
        Family.stub(:find) { mock_family(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:family).should be(mock_family)
      end

      it "re-renders the 'edit' template" do
        Family.stub(:find) { mock_family(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested family" do
      Family.should_receive(:find).with("37") { mock_family }
      mock_family.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the families list" do
      Family.stub(:find) { mock_family }
      delete :destroy, :id => "1"
      response.should redirect_to(families_url)
    end
  end

end
