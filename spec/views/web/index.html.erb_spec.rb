require 'spec_helper'

describe "web/index.html.erb" do
	it "display a login link" do
		render
		rendered.should contain("Login")
	end
end