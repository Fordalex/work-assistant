class CleanUpTables < ActiveRecord::Migration[6.1]
  def change
    drop_table :categories
    drop_table :job_type_groups
    drop_table :job_types
    drop_table :language_groups
    drop_table :languages
    drop_table :member_groups
    drop_table :members
    drop_table :subject_groups
    drop_table :subjects
    remove_column :users, :collection_id
  end
end
