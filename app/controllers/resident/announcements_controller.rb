class Resident::AnnouncementsController < ApplicationController
    def index
        @announcements = Announcement.joins(:user)
                                .where(users: { role: 'admin', 
                                               barangay: current_user.barangay, 
                                               city_municipality: current_user.city_municipality,
                                               province: current_user.province })
                                .order(created_at: :desc)
      end
    
      def show
        @announcement = Announcement.find(params[:id])
      end
end
