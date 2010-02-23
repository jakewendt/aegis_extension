require File.dirname(__FILE__) + '/test_helper'
require 'aegis_extensions_controller'

ActionController::Routing::Routes.draw do |map|
	map.resources :aegis_extensions
end

class AegisExtensionsControllerTest < ActionController::TestCase

	def setup
		setup_db
	end

	def teardown
		teardown_db
	end

	test "anyone can get new" do
		get :new
	end

	test "owner can edit" do
		u = User.create
		p = Post.create(:user_id => u.id)
		get :edit, :id => p.id
	end

	test "non-owner cannot edit" do
		u = User.create
		p = Post.create(:user_id => u.id)
		get :edit, :id => p.id
	end

end
