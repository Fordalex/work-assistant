class CreateUserGroup < ActiveRecord::Migration[6.1]
  def change
    create_table :user_groups do |t|
      t.references :user
      t.references :collection

      t.timestamps
    end
  end
end
