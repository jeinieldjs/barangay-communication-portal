class Resident::PostsController < ApplicationController
    before_action :authenticate_user!

    def index
      current_user_location = {
        province: current_user.province,
        city_municipality: current_user.city_municipality,
        barangay: current_user.barangay
      }
  
      @posts = Post.joins(:user)
                       .where(users: { status: 'approved', province: current_user_location[:province], city_municipality: current_user_location[:city_municipality], barangay: current_user_location[:barangay] })
      @comments = Comment.all
  
      if params[:content_query].present?
        @posts = @posts.where("LOWER(content) LIKE ?", "%#{params[:content_query].downcase}%")
      end
    
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
        redirect_to resident_posts_path notice: 'Post created successfully.'
      else
        render :new
      end
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :content, :anonymous)
    end
end
