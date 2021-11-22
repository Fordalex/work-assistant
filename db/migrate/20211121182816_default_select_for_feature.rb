class DefaultSelectForFeature < ActiveRecord::Migration[6.1]
  def change
    change_column :features, :feature_ticket_type, :string, default: "Select"
  end
end
