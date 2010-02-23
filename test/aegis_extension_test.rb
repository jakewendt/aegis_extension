require 'test/unit'
require 'rubygems'
require 'active_record'
require 'action_controller'
require 'active_support/test_case'
require 'aegis'
require File.dirname(__FILE__) + '/../init'

ActiveRecord::Base.establish_connection(:adapter => "sqlite3", :database => ":memory:")

def setup_db
	ActiveRecord::Schema.define(:version => 1) do
		create_table :users do |t|
			t.string :name
			t.string :role_name
			t.timestamps
		end
		create_table :posts do |t|
			t.references :user
			t.string :title
			t.text   :body
			t.timestamps
		end
	end
end

def teardown_db
	ActiveRecord::Base.connection.tables.each do |table|
		ActiveRecord::Base.connection.drop_table(table)
	end
end


class User < ActiveRecord::Base
	has_many :posts
	has_role :default => :user
	validates_role_name
end

class Post < ActiveRecord::Base
	belongs_to :user
end

class Permissions < Aegis::Permissions
	role :user
	role :moderator
	role :administrator, :default_permission => :allow
	permission :administrate do
	end
	permission :moderate do
		allow :moderator
	end
	permission :crud_post do |user,post|
		allow :user do
			user == post.user
		end
	end
end

class AegisExtensionTest < ActiveSupport::TestCase

	def setup
		setup_db
	end

	def teardown
		teardown_db
	end

	def test_the_truth
		assert true
	end

	test "new test style" do

	end

end
