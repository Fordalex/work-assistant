class AddReferencesForCollection < ActiveRecord::Migration[6.1]
  def change
    add_reference :tickets, :collection
    add_reference :users, :collection
    add_reference :feature_types, :collection
  end
end
