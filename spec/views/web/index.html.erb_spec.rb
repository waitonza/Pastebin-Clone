require 'spec_helper'

describe "web/index.html.erb" do
	it "display a login link" do
		render
		rendered.should contain("Login")
	end

	it "display a create new pastebin" do
		render
		rendered.should contain("Create new Pastebin")
	end
end