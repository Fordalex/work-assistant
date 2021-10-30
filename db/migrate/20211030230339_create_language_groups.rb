class CreateLanguageGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :language_groups do |t|
      t.references :language
      t.references :ticket

      t.timestamps
    end
  end
end
