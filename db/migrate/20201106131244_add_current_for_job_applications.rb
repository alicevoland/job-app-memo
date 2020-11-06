class AddCurrentForJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :current, :boolean, default: false
  end
end
