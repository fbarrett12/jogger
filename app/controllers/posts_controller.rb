class PostsController < ApplicationController
    # before_action :post_params, except: [:index, :new, :create]

    def index
        if logged_in?
            @posts = @current_user.posts
          else
            redirect_to home_path 
        end
    end

    def new
        @post = Post.new()
    end

    def create
        if logged_in?
            @post = Post.create(post_params)
            @post.user_id = @current_user.id
            @post.save 
            
                if @post.valid?
                    redirect_to @post
                else 
                    flash[:errors] = @post.errors.full_messages
                    redirect_to new_post_path
                end
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        @post.update(post_params)
        redirect_to @post
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    
    # helper methods

    private

    def post_params
        params.require(:post).permit(:title, :body, :user_id)
    end
end
