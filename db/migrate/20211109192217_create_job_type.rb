class CreateJobType < ActiveRecord::Migration[6.1]
  def change
    create_table :job_types do |t|
      t.name
      t.references :user

      t.timestamps
    end
  end
end
