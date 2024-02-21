class Admin::PostsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_post, only: [:destroy]
  
    def index
      current_user_location = {
        province: current_user.province,
        city_municipality: current_user.city_municipality,
        barangay: current_user.barangay
      }
  
      @posts = Post.joins(:user)
                       .where(users: { status: 'approved', province: current_user_location[:province], city_municipality: current_user_location[:city_municipality], barangay: current_user_location[:barangay] })
  
    
    end
  
    def my_posts
      @user_posts = current_user.posts 
    end
  
    def new
      @post = Post.new
    end
  
    def create
      @post = current_user.posts.build(post_params)
  
      if @post.save
        redirect_to admin_posts_path notice: 'Post created successfully.'
      else
        render :new
      end
    end

    def destroy
      @post.destroy
      redirect_to admin_posts_path, notice: 'Post was successfully deleted.'
    end

    private
  
    def set_post
      @post = Post.find(params[:id])
    end
  
    def post_params
      params.require(:post).permit(:title, :content, :anonymous)
    end
end
