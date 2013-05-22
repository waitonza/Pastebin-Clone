require 'spec_helper'

describe UsersController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end
  end

  describe "GET logout" do
	  context "when user logout" do
	    it "redirect to the Web index" do
	    	get :logout
	    	response.should redirect_to(:controller => "web", :action => "index")
	  	end
	  end
  end

  describe "POST create" do
	  let(:user) { mock_model(User).as_null_object }

	  before do
	  	User.stub(:new).and_return(user)
	  end

	  it "creates a new user" do
	    post :create, :user => {"username" => "ABC",
	    		"email" => "ABC@gmail.com",
	    		"password" => "1234567",
	    		"password_confirmation" => "1234567"}
	  end

	  it "saves the user" do
	  	user.should_receive(:save)
	  	post :create, :user => {"username" => "ABC",
	    		"email" => "ABC@gmail.com",
	    		"password" => "1234567",
	    		"password_confirmation" => "1234567"}
	  end

	  context "when the user saves successfully" do
	    it "sets a flash[:notice] message" do
	    	post :create, :user => {"username" => "ABC",
	    		"email" => "ABC@gmail.com",
	    		"password" => "1234567",
	    		"password_confirmation" => "1234567"}
	    	flash[:notice].should eq("You Signed up successfully")
	    	flash[:color].should eq("valid")
	    end

	    it "redirect to the Web index" do
	    	post :create, :user => {"username" => "ABC",
	    		"email" => "ABC@gmail.com",
	    		"password" => "1234567",
	    		"password_confirmation" => "1234567"}
	    	response.should redirect_to(:controller => 'web', :action => 'index')
	  	end
	  end

	  context "when the user fails to save" do
	  	before do
	  		user.stub(:save).and_return(false)
	  	end

	     it "sets a flash[:notice] message" do
	     	post :create, :user => {"username" => "ABC",
	    		"email" => "ABC@gmail.com",
	    		"password" => "1234567",
	    		"password_confirmation" => "1234567"}
	     	flash[:notice].should eq("Form is invalid")
	    	flash[:color].should eq("invalid")
	     end

	     it "renders the new template" do
	     	post :create, :user => {"username" => "ABC",
	    		"email" => "ABC@gmail.com",
	    		"password" => "1234567",
	    		"password_confirmation" => "1234567"}
	     	response.should render_template("new")
	     end
	  end

	end

end
