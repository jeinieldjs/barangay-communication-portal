class Admin::AnnouncementsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_announcement, only: [:show, :edit, :update, :destroy]

    def index
        @announcements = Announcement.joins(:user)
        .where(users: { role: 'admin', 
                       barangay: current_user.barangay, 
                       city_municipality: current_user.city_municipality,
                       province: current_user.province })
        .order(created_at: :desc)
    end

    def show
    end

    def new
        @announcement = Announcement.new
    end

    def create
        @announcement = Announcement.new(announcement_params)
        @announcement.user = current_user

        if @announcement.save
            redirect_to admin_announcements_path, notice: 'Announcement was successfully published.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @announcement.update(announcement_params)
            redirect_to admin_announcements_path, notice: 'Announcement was successfully updated.'
        else
            render :edit
        end
    end

    def destroy
        @announcement.destroy
        redirect_to admin_announcements_path, notice: 'Announcement was successfully deleted.'
    end

    private

    def set_announcement
        @announcement = Announcement.find(params[:id])
    end

    def announcement_params
        params.require(:announcement).permit(:title, :content)
    end

end
