class JobApplication < ApplicationRecord
  belongs_to :user
  has_many :job_informations

  validates :title, presence: true, allow_blank: false

  def sorted_job_informations
    job_informations.order(:created_at)
  end
end
