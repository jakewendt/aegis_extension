require File.dirname(__FILE__) + '/test_helper'
require 'application_controller'
require 'posts_controller'

ActionController::Routing::Routes.draw do |map|
	map.resources :posts
end

class PostsControllerTest < ActionController::TestCase

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
		login_as u
		p = Post.create(:user_id => u.id)
		get :edit, :id => p.id
		assert_response :success
	end

	test "non-owner cannot edit" do
		login_as User.create
		p = Post.create(:user_id => User.create.id)
		get :edit, :id => p.id
		assert_response :redirect
	end

end
