class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :job_applications

  def get_job_applications(archived:, current:)
    job_applications.order(created_at: :desc).filter { |job| job.archived == archived && job.current == current }
  end
end
