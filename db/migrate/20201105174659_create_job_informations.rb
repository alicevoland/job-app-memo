class CreateJobInformations < ActiveRecord::Migration[6.0]
  def change
    create_table :job_informations do |t|
      t.belongs_to :job_application
      t.string :name
      t.text :content

      t.timestamps
    end
  end
end
