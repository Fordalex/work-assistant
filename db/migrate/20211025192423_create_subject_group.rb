class CreateSubjectGroup < ActiveRecord::Migration[6.1]
  def change
    create_table :subject_groups do |t|
      t.references :ticket
      t.references :subject

      t.timestamps
    end
  end
end
