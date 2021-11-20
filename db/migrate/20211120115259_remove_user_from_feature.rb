class RemoveUserFromFeature < ActiveRecord::Migration[6.1]
  def change
    remove_column :features, :user_id
  end
end
