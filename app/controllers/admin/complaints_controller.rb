class Admin::ComplaintsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_complaint, only: [:edit, :update, :show]

  def index
    @complaints = Complaint.joins(:user).where(users: { 
      barangay: current_user.barangay,
      city_municipality: current_user.city_municipality,
      province: current_user.province
    })
  end

  def edit
  end

  def update
    if @complaint.update(complaint_params)
      redirect_to admin_complaints_path, notice: 'Complaint status was successfully updated.'
    else
      render :edit
    end
  end

  def show
  end

  private

  def set_complaint
    @complaint = Complaint.find(params[:id])
  end

  def complaint_params
    params.require(:complaint).permit(:status)
  end


end
