class PostsController < ApplicationController


	def new
		@post = Post.new
	end
	
	
	# The create action of the post object which enables us to create the Post in the model Post.
	def create
		@post = Post.new(post_params)
		
		# The model will validate the entries and return a bool.
		if @post.save
			redirect_to @post
		else
			# new action is now creating a new instance variable called @post, and you'll see why that is in just a few moments.
			render 'new'
		end
	end

	
	# show action of the post object show the created post after it's submitted.
	def show
		# We use Post.find to find the post we're interested in, passing in params[:id] to get the :id parameter from the request. 
		# We also use an instance variable (prefixed by @) to hold a reference to the post object.
		# We do this because Rails will pass all instance variables to the view.
		@post = Post.find(params[:id])
	end

	
	#shows all the created posts.
	def index
		#gets all posts created in Post model
		@post = Post.all 
	end

	
	# edits a post.
	def edit
		#gets the post by it's id
		@post = Post.find(params[:id])
	end
	
	
	# updates an existing post.
	def update
		@post = Post.find(params[:id])
		
		if @post.update(post_params)
			redirect_to @post
		else
			render 'edit'
		end
	end
	
	
	# destroys a post
	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		
		redirect_to posts_path
	end	
	
	# Private method used to get the title and text of the post only. permit allow us to accept :title and :text
	private
	def post_params
		params.require(:post).permit(:title, :text)
	end


end

