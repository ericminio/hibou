require 'spec_helper'

describe ChildrenController do
  before :each do
    @user = User.create(:email => "elvis@memphis.te",
           :password => "hunhun",
           :password_confirmation => "hunhun")
    sign_in @user
  end

  def mock_child(stubs={})
    (@mock_child ||= mock_model(Child).as_null_object).tap do |child|
      child.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all children as @children" do
      Child.stub(:all) { [mock_child] }
      get :index
      assigns(:children).should eq([mock_child])
    end
  end

  describe "GET show" do
    it "assigns the requested child as @child" do
      Child.stub(:find).with("37") { mock_child }
      get :show, :id => "37"
      assigns(:child).should be(mock_child)
    end

    it "generates the child file pdf for the right child" do
      tom = Child.new( :first_name => 'tom',:last_name =>'trempe') 

      mock_pdf_child_file = mock(PDFChildFile)

      Child.stub(:find).with("37") { tom }
      PDFChildFile.stub(:new){ mock_pdf_child_file }

      mock_pdf_child_file.should_receive(:generate_for).with(tom)

      get :show, :id => "37", :format => "pdf"

      response.content_type.should == "application/pdf"
      response.headers["Content-Disposition"].should == "attachment; filename=\"tomtrempe.pdf\""

    end



  end


  describe "GET new" do
    it "assigns a new child as @child" do
      Child.stub(:new) { mock_child }
      get :new
      assigns(:child).should be(mock_child)
    end
  end

  describe "GET edit" do
    it "assigns the requested child as @child" do
      Child.stub(:find).with("37") { mock_child }
      get :edit, :id => "37"
      assigns(:child).should be(mock_child)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created child as @child" do
        Child.stub(:new).with({'these' => 'params'}) { mock_child(:save => true) }
        post :create, :child => {'these' => 'params'}
        assigns(:child).should be(mock_child)
      end

      it "redirects to the created child" do
        Child.stub(:new) { mock_child(:save => true) }
        post :create, :child => {}
        response.should redirect_to(child_url(mock_child))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved child as @child" do
        Child.stub(:new).with({'these' => 'params'}) { mock_child(:save => false) }
        post :create, :child => {'these' => 'params'}
        assigns(:child).should be(mock_child)
      end

      it "re-renders the 'new' template" do
        Child.stub(:new) { mock_child(:save => false) }
        post :create, :child => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested child" do
        Child.should_receive(:find).with("37") { mock_child }
        mock_child.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :child => {'these' => 'params'}
      end

      it "assigns the requested child as @child" do
        Child.stub(:find) { mock_child(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:child).should be(mock_child)
      end

      it "redirects to the child" do
        Child.stub(:find) { mock_child(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(child_url(mock_child))
      end
    end

    describe "with invalid params" do
      it "assigns the child as @child" do
        Child.stub(:find) { mock_child(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:child).should be(mock_child)
      end

      it "re-renders the 'edit' template" do
        Child.stub(:find) { mock_child(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested child" do
      Child.should_receive(:find).with("37") { mock_child }
      mock_child.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the children list" do
      Child.stub(:find) { mock_child }
      delete :destroy, :id => "1"
      response.should redirect_to(children_url)
    end
  end

end
