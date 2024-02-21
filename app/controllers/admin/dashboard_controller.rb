class Admin::DashboardController < ApplicationController
    def index
        @announcement = Announcement.joins(:user)
        .where(users: { role: 'admin', 
                       barangay: current_user.barangay, 
                       city_municipality: current_user.city_municipality,
                       province: current_user.province })
        .last
    
        @complaints = Complaint.joins(:user).where(users: { 
        barangay: current_user.barangay,
        city_municipality: current_user.city_municipality,
        province: current_user.province
      }).where(status: 'pending').order(created_at: :desc).limit(3)
      end
    
      def create_admin_account
        admin = Admin.create!(
          email: "admin@example.com",
          password: "adminpassword",
          password_confirmation: "adminpassword"
        )
        if admin.persisted?
          flash[:notice] = "Admin account created successfully!"
          redirect_to admin_dashboard_path
        else
          flash[:alert] = "Failed to create admin account"
          redirect_to admin_dashboard_path
        end
      end
end
