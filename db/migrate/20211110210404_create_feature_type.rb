class CreateFeatureType < ActiveRecord::Migration[6.1]
  def change
    create_table :feature_types do |t|
      t.string :name
      t.string :colour

      t.references :user
      t.references :feature
      t.timestamps
    end
  end
end
