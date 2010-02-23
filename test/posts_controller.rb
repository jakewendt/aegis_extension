class PostsController < ApplicationController

	before_filter :id_required, :only => [ :edit, :update, :destroy, :show ]
	before_filter :may_edit_post_required, :only => [ :edit, :update ]
	before_filter :may_destroy_post_required, :only => [ :destroy ]

	def new
		render :text => ''
	end

	def create
		render :text => ''
	end

	def edit
		render :text => ''
	end

	def update
		render :text => ''
	end

	def destroy
		render :text => ''
	end

	def show
		render :text => ''
	end

	def index
		render :text => ''
	end

protected

	def id_required
		if !params[:id].blank? and Post.exists?(params[:id])
			@post = Post.find(params[:id])
		else
			access_denied("post id required!", posts_path)
		end
	end

end
