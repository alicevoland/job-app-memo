class JobApplicationsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_my_profile

  def show
    @user = User.find(params[:user_id])
    @job_application = @user.job_applications.find(params[:id])
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, extensions = {})
    @description_html = markdown.render(@job_application.description)
  end

  def index
    @user = User.find(params[:user_id])
    @job_applications = @user.job_applications.order(updated_at: :desc)
  end

  private

  def is_my_profile
    unless current_user == User.find(params[:user_id])
      flash[:danger] = 'Vous ne pouvez pas accéder aux informations de ce compte'
      redirect_to :root
    end
  end
end
