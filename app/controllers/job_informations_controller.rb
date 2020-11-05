class JobInformationsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_my_profile

  def new
    @user = User.find(params[:user_id])
    @job_application = @user.job_applications.find(params[:job_application_id])
    @new_job_information = @job_application.job_informations.new
    render 'job_applications/show'
  end

  def create
    @user = User.find(params[:user_id])
    @job_application = @user.job_applications.find(params[:job_application_id])
    @new_job_information = @job_application.job_informations.new(job_information_params)
    if @new_job_information.save
      flash[:success] = 'Nouvelle information ajoutée'
      redirect_to user_job_application_path(@user, @job_application)
    else
      render 'job_applications/show'
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @job_application = @user.job_applications.find(params[:job_application_id])
    @edit_job_information = @job_application.job_informations.find(params[:id])
    render 'job_applications/show'
  end

  def update
    @user = User.find(params[:user_id])
    @job_application = @user.job_applications.find(params[:job_application_id])
    @edit_job_information = @job_application.job_informations.find(params[:id])
    if @edit_job_information.update(job_information_params)
      flash[:success] = 'Information modifiée'
      redirect_to user_job_application_path(@user, @job_application)
    else
      render 'job_applications/show'
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @job_application = @user.job_applications.find(params[:job_application_id])
    @destroy_job_information = @job_application.job_informations.find(params[:id])
    if @destroy_job_information.destroy
      flash[:success] = 'Information supprimée'
      redirect_to user_job_application_path(@user, @job_application)
    else
      render 'job_applications/show'
    end
  end

  private

  def is_my_profile
    unless current_user == User.find(params[:user_id])
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end

  def job_information_params
    permitted = params.require(:job_information).permit(:name, :content)
  end
end
