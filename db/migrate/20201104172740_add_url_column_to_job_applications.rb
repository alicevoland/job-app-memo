class AddUrlColumnToJobApplications < ActiveRecord::Migration[6.0]
  def change
    add_column :job_applications, :url, :string
  end
end
