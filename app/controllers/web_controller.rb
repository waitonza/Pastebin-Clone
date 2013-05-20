class WebController < ApplicationController
  def index
  end

  def login
  	@user = User.new
  end

  def logout
  end
end
