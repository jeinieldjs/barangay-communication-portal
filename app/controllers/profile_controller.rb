class ProfileController < ApplicationController
    before_action :authenticate_user!

  def update_profile_picture
    if current_user.update(user_params)
      redirect_to resident_dashboard_index_path, notice: 'Profile picture updated successfully.'
    else
      redirect_to resident_dashboard_index_path, alert: 'Profile picture not uploaded.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:image)
  end
end
