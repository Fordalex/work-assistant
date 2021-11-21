class AddFeatureTypeType < ActiveRecord::Migration[6.1]
  def change
    add_column :features, :feature_ticket_type, :string
  end
end
