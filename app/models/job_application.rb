class JobApplication < ApplicationRecord
  belongs_to :user
  has_many :job_informations

  def sorted_job_informations
    job_informations.order(created_at: :desc)
  end
end
