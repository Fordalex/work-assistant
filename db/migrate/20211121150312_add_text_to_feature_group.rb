class AddTextToFeatureGroup < ActiveRecord::Migration[6.1]
  def change
    add_column :feature_groups, :text, :text
  end
end
