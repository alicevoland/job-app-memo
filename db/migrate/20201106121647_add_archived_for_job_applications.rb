class AddArchivedForJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :archived, :boolean, default: false
  end
end
