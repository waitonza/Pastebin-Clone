require 'spec_helper'

describe UsersController do

  describe "GET 'login'" do
    it "returns http success" do
      get 'login'
      response.should be_success
    end
  end

  describe "GET 'logout'" do
    it "returns http success" do
      get 'logout'
      response.should be_success
    end
  end

  describe "POST create" do
  	context "Login form login page" do
	    it "redirect to the homepage" do
	    	post :create
	    	response.should redirect_to(:controller => "web", :action => "index")
	  	end
	 end
   end
end