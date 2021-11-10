class CreateFeatureGroup < ActiveRecord::Migration[6.1]
  def change
    create_table :feature_groups do |t|
      t.references :feature
      t.references :ticket

      t.timestamps
    end
  end
end
