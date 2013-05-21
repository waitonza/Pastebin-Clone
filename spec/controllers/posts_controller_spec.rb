require 'spec_helper'

describe PostsController do

	describe "POST create" do
	  let(:post1) { mock_model(Post).as_null_object }

	  before do
	  	Post.stub(:new).and_return(post1)
	  end

	  it "creates a new paste" do
	    post :create, :post => {"name" => "Test paste",
	    		"user" => "ABC",
	    		"paste_content" => "PASTE TEST TEST"}
	  end

	  it "saves the paste" do
	  	post1.should_receive(:save)
	  	post :create
	  end

	  context "when the paste saves successfully" do
	    it "sets a flash[:notice] message" do
	    	post :create
	    	flash[:notice].should eq("You Paste successfully")
	    	flash[:color].should eq("valid")
	    end

	    it "redirect to the Web index" do
	    	post :create
	    	response.should redirect_to(:action => 'show', :id => assigns[:post])
	  	end
	  end

	  context "when the paste fails to save" do
	  	before do
	  		post1.stub(:save).and_return(false)
	  	end

	     it "sets a flash[:notice] message" do
	     	post :create
	     	flash[:notice].should eq("Form is invalid")
	    	flash[:color].should eq("invalid")
	     end

	     it "renders the new template" do
	     	post :create
	    	response.should redirect_to(:controller => 'web', :action => 'new', :post => assigns[:post])
	     end
	  end

	end

end
