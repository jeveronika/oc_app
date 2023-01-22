class UsersController < ApplicationController
  before_action :set_user
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found


  def profile
  end

  

  private
  def set_user
    @user = User.find(params[:id])
  end


  def record_not_found
    redirect_to root_path, notice: "Uživatel nenalezen"
  end

end
