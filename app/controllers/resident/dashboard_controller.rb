class Resident::DashboardController < ApplicationController
    class Resident::DashboardController < ApplicationController
        before_action :authenticate_user!
        before_action :set_post, only: [:edit, :update, :destroy]
      
        def index
          @posts = Post.all
          @post = Post.new
          @announcements = Announcement.joins(:user)
                                  .where(users: { role: 'admin', 
                                                 barangay: current_user.barangay, 
                                                 city_municipality: current_user.city_municipality,
                                                 province: current_user.province })
                                  .order(created_at: :desc)
                                  .limit(3)
    
        end
      
        def new
          @post = Post.new
        end
      
        def create
          @post = current_user.posts.build(post_params)
      
          if @post.save
            redirect_to resident_dashboard_path, notice: 'Post created successfully.'
          else
            render :new
          end
        end
      
        def edit
        end
      
        def update
          if @post.update(post_params)
            redirect_to resident_dashboard_path, notice: 'Post updated successfully.'
          else
            render :edit
          end
        end
      
        def destroy
          @post.destroy
          redirect_to resident_dashboard_path, notice: 'Post deleted successfully.'
        end
      
        private
      
        def set_post
          @post = current_user.posts.find(params[:id])
        end
      
        def post_params
          params.require(:post).permit(:title, :content)
        end
      end
      
end
