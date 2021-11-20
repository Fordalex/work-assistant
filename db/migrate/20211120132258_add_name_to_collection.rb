class AddNameToCollection < ActiveRecord::Migration[6.1]
  def change
    add_column :collections, :name, :string
  end
end
