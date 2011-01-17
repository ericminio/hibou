require 'spec_helper'

describe ChildrenController do
  before :each do
    sign_in User.make!
  end

  describe "viewing child" do
    before(:each) do
      @tom = Child.make(:first_name => 'Tom', :last_name =>'Trempe')
      Child.stub(:find).with("37") { @tom }
    end

    it "attaches a pdf file named after the child" do
      get :show, :id => "37", :format => "pdf"

      pdf = PDF::Inspector::Text.analyze(response.body)
      pdf.strings.should contain('Tom Trempe')
      response.content_type.should =~ /application\/pdf/
      response.headers["Content-Disposition"].should =~ /attachment/
      response.headers["Content-Disposition"].should =~ /Tom_Trempe.pdf/
    end
  end

end
