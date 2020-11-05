class RemoveUrlDescriptionFromJobApplications < ActiveRecord::Migration[6.0]
  def change
    remove_column :job_applications, :url, :string
    remove_column :job_applications, :description, :text
  end
end
