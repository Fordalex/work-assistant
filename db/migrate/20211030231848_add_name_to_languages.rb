class AddNameToLanguages < ActiveRecord::Migration[6.1]
  def change
    add_column :languages, :name, :string
  end
end
