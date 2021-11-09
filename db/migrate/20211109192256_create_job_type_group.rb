class CreateJobTypeGroup < ActiveRecord::Migration[6.1]
  def change
    create_table :job_type_groups do |t|
      t.references :job_type
      t.references :ticket

      t.timestamps
    end
  end
end
