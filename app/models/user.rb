class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :job_applications

  def current_job_applications
    job_applications.order(created_at: :desc).filter { |job| !job.archived }
  end

  def archived_job_applications
    job_applications.order(created_at: :desc).filter { |job| job.archived }
  end
end
