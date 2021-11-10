class CreateFeature < ActiveRecord::Migration[6.1]
  def change
    create_table :features do |t|
      t.string :name
      t.text :content
      t.references :feature_type
      t.references :feature_group
      t.references :user

      t.timestamps
    end
  end
end
