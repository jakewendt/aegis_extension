require File.dirname(__FILE__) + '/test_helper'

class AegisExtensionTest < ActiveSupport::TestCase

	def setup
		setup_db
	end

	def teardown
		teardown_db
	end

	test "user may create a post" do
		assert User.new.may_create_post?
	end

	test "user may view a post" do
		assert User.new.may_read_post?
		assert User.new.may_view_post?
	end

	test "post owner may edit post" do
		u = User.create
		u.posts << Post.create
		assert u.may_edit_post?(u.posts.first)
	end

	test "post owner may update post" do
		u = User.create
		u.posts << Post.create
		assert u.may_update_post?(u.posts.first)
	end

	test "post owner may destroy post" do
		u = User.create
		u.posts << Post.create
		assert u.may_destroy_post?(u.posts.first)
	end

	test "post non-owner may NOT edit post" do
		post = Post.create
		u = User.create
		assert !u.may_edit_post?(post)
	end

	test "post non-owner may NOT update post" do
		post = Post.create
		u = User.create
		assert !u.may_update_post?(post)
	end

	test "post non-owner may NOT destroy post" do
		post = Post.create
		u = User.create
		assert !u.may_destroy_post?(post)
	end

	test "asdf" do

	end

end
