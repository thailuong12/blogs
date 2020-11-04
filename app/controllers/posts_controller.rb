class PostsController < ApplicationController
    before_action :post_params, only: [:create, :update]

    def index
        @posts = policy_scope(Post)
    end

    def new
        @post = Post.new
    end

    def create
        current_user.posts.create!(post_params)
        redirect_to posts_path
    end

    def show
        authorize_post
        @post = post
    end

    def edit
        authorize_post
        @post = post
    end

    def update
        authorize_post
        if post.update!(post_params)
            redirect_to posts_path
        end
    end

    def destroy
        authorize_post
        if post.destroy
            redirect_to posts_path
        end
    end

    private

    def post_params
      params.require(:post).permit(:title, :body)
    end

    def post
        @_post ||= Post.find_by(id: params[:id])
    end

    def authorize_post
        post && authorize(post)
    end
end
