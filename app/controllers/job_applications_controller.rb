class JobApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_my_profile

  def show
    @user = User.find(params[:user_id])
    @job_application = @user.job_applications.find(params[:id])
    @job_information = @job_application.job_informations.new
  end

  def index
    @user = User.find(params[:user_id])
    @job_applications = @user.job_applications.order(updated_at: :desc)
    @job_application = @user.job_applications.new
  end

  def create
    @user = User.find(params[:user_id])
    @job_application = @user.job_applications.new(job_application_params)
    if @job_application.save
      flash[:success] = 'Nouvelle candidature créée'
      redirect_to user_job_application_path(@user, @job_application)
    else
      render :index
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @job_application = @user.job_applications.find(params[:id])
  end

  def update
    @user = User.find(params[:user_id])
    @job_application = @user.job_applications.find(params[:id])
    if @job_application.update(job_application_params)
      flash[:success] = 'Candidature modifiée'
      redirect_to user_job_application_path(@user, @job_application)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @job_application = @user.job_applications.find(params[:id])
    if @job_application.destroy
      flash[:success] = 'Candidature supprimée'
    else
      flash[:danger] = 'Une erreur est survenue'
    end
    redirect_to user_job_applications_path(@user)
  end

  private

  def is_my_profile
    unless current_user == User.find(params[:user_id])
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end

  def job_application_params
    permitted = params.require(:job_application).permit(:title)
  end
end
