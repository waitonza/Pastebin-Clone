class Post < ActiveRecord::Base
	validates :name, :presence => true
	validates :paste_content, :presence => true
end
