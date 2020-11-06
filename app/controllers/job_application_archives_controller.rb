class JobApplicationArchivesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_my_profile

  def create
    @user = User.find(params[:user_id])
    @job_application = @user.job_applications.find(params[:job_application_id])
    @job_application.update(archived: !@job_application.archived)
    redirect_to user_job_applications_path(@user)
  end

  private

  def is_my_profile
    unless current_user == User.find(params[:user_id])
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end
end
