class AddColourToFeatures < ActiveRecord::Migration[6.1]
  def change
    add_column :features, :colour, :string
  end
end
