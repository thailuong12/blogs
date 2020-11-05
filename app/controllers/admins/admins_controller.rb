class Admins::AdminsController < ApplicationController
    before_action :check_is_admin

    def posts
        @posts = Post.all
    end

    private

    def check_is_admin
        redirect_to root_path if !current_user.is_admin?
    end
end
