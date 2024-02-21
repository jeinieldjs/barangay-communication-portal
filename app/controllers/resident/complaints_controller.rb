class Resident::ComplaintsController < ApplicationController
    class Resident::ComplaintsController < ApplicationController
        before_action :authenticate_user!
        
        def index
          @complaints = current_user.complaints
        end
      
        def show
          @complaint = Complaint.find(params[:id])
        end
      
        def new
          @complaint = Complaint.new
        end
      
        def create
          @complaint = current_user.complaints.build(complaint_params)
          if @complaint.save
            redirect_to resident_complaints_path, notice: 'Complaint was reported to barangay admin.'
          else
            render :new, status: :unprocessable_entity
          end
      
        end
      
        private
      
        def complaint_params
          params.require(:complaint).permit(:subject, :description, :status)
        end
      
      end
      
end
