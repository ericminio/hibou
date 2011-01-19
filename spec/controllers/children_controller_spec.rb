require 'spec_helper'

describe ChildrenController do
  before :each do
    sign_in User.make!
  end

  describe "when viewing a child" do
    before(:each) do
      @tom = Child.make(:id => 37, :first_name => 'Tom', :last_name =>'Trempe')
      Child.stub(:find).with("37") { @tom }
    end

    it "attaches a pdf file named after the child" do
      get :show, :id => "37", :format => "pdf"

      analyse(response.body).strings.should contain('Tom Trempe')
      response.content_type.should == Mime::PDF
      response.headers["Content-Disposition"].should =~ /inline/
      response.headers["Content-Disposition"].should =~ /37-tom-trempe.pdf/
    end
  end

  def analyse(data)
    PDF::Inspector::Text.analyze(data)
  end
end
